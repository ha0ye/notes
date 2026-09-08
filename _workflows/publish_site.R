#!/usr/bin/env Rscript

# Build a Quarto site from vault notes flagged for sharing.
#
# Scans the vault for markdown files with `share: true` in their frontmatter
# and writes them into _publish/content/ as a Quarto project (frontmatter is
# passed through unchanged aside from a `title` override; note text is
# copied as-is — Obsidian wikilinks are not converted). Run `quarto render`
# (or `quarto preview`) inside _publish/ afterward to build/preview the
# site, and `quarto publish gh-pages` (from _publish/) to publish it.
#
# Usage: Rscript _workflows/publish_site.R
# Requires: the "here" and "yaml" packages
#   install.packages(c("here", "yaml"))
#
# Processing flow:
#
#   VAULT (source of truth)
#     01_notes/, 02_projects/, 03_people/, 00_resources/, 99_tracking/
#       - notes with `share: true` in frontmatter opt in to publishing
#       - everything else stays private, never leaves the vault
#              |
#              v  (this script: filter by `share: true`, slugify
#                  filename, inject title into frontmatter, copy body
#                  through unmodified)
#     _publish/content/*.qmd   <- generated, gitignored, disposable
#     _publish/index.qmd       <- generated list of links
#              |
#              v  quarto render / quarto preview
#     _publish/_site/          <- rendered HTML, gitignored, disposable
#              |
#              v  quarto publish gh-pages
#     GitHub Pages             <- public, view-only
#
# Everything from _publish/content/ onward is regenerated from scratch
# each run; only the vault notes and their `share` flags are persistent.

# --- Dependency check ---
required_pkgs <- c("here", "yaml")
missing_pkgs <- required_pkgs[!vapply(required_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_pkgs) > 0) {
  stop(sprintf(
    "Missing required package(s): %s. Install with install.packages(c(%s)).",
    paste(missing_pkgs, collapse = ", "),
    paste(sprintf("\"%s\"", missing_pkgs), collapse = ", ")
  ))
}

vault_dir <- here::here()
publish_dir <- file.path(vault_dir, "_publish")
content_dir <- file.path(publish_dir, "content")

# Folders to scan. Voice-preserved folders (01_notes, 99_tracking) are
# included because the `share: true` flag is something the user opts into
# themselves on a per-note basis, not something this script or an AI adds.
content_folders <- file.path(vault_dir, c(
  "00_resources", "01_notes", "02_projects", "03_people", "99_tracking"
))
content_folders <- content_folders[dir.exists(content_folders)]

md_files <- list.files(
  content_folders, pattern = "\\.md$", recursive = TRUE, full.names = TRUE
)

# --- Parse frontmatter + body ---
read_note <- function(path) {
  lines <- readLines(path, warn = FALSE)
  if (length(lines) < 2 || lines[1] != "---") {
    return(list(frontmatter = list(), body = paste(lines, collapse = "\n")))
  }
  end_idx <- which(lines[-1] == "---")[1]
  if (is.na(end_idx)) {
    return(list(frontmatter = list(), body = paste(lines, collapse = "\n")))
  }
  fm_lines <- lines[2:end_idx]
  body_lines <- lines[(end_idx + 2):length(lines)]
  frontmatter <- tryCatch(
    yaml::yaml.load(paste(fm_lines, collapse = "\n")),
    error = function(e) list()
  )
  list(frontmatter = frontmatter, body = paste(body_lines, collapse = "\n"))
}

notes <- lapply(md_files, read_note)
names(notes) <- md_files

is_shared <- vapply(notes, function(n) isTRUE(n$frontmatter$share), logical(1))
shared_paths <- md_files[is_shared]

if (length(shared_paths) == 0) {
  message("No notes with `share: true` found. Nothing to publish.")
  quit(status = 0)
}

slugify <- function(name) {
  name <- tolower(name)
  name <- gsub("[^a-z0-9]+", "-", name)
  gsub("^-+|-+$", "", name)
}

basenames <- tools::file_path_sans_ext(basename(shared_paths))
slugs <- slugify(basenames)
names(slugs) <- basenames # map note title (filename) -> slug

# --- Write output ---
unlink(content_dir, recursive = TRUE)
dir.create(content_dir, recursive = TRUE, showWarnings = FALSE)

index_entries <- character(0)

for (path in shared_paths) {
  note <- notes[[path]]
  title <- tools::file_path_sans_ext(basename(path))
  slug <- slugs[[title]]

  fm_list <- note$frontmatter
  fm_list$title <- title
  fm_yaml <- yaml::as.yaml(fm_list)

  out_path <- file.path(content_dir, paste0(slug, ".qmd"))
  writeLines(c("---", fm_yaml, "---", "", note$body), out_path)
  index_entries <- c(index_entries, sprintf("- [%s](content/%s.qmd)", title, slug))
}

index_qmd <- c(
  "---",
  "title: \"Notes\"",
  "---",
  "",
  index_entries
)
writeLines(index_qmd, file.path(publish_dir, "index.qmd"))

message(sprintf("Published %d note(s) to %s", length(shared_paths), content_dir))
message("Next: cd _publish && quarto render   (or `quarto preview` to check locally)")
