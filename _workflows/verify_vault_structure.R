#!/usr/bin/env Rscript

# Verify PKM vault structure
# Run from vault root: Rscript _workflows/verify_structure.R

vault_dir <- getwd()

report <- function(header, checks) {
  if (all(checks$pass)) {
    message(header, " PASS")
    return(TRUE)
  }
  message(header)
  failed <- checks$label[!checks$pass]
  message(paste0("  FAIL: ", failed, collapse = "\n"))
  FALSE
}

pass <- TRUE

# --- Required folders ---
required_folders <- c(
  "_workflows", "00_resources", "01_notes", "02_projects",
  "03_people", "999_templates", "99_tracking"
)
checks <- data.frame(
  label = required_folders,
  pass = dir.exists(file.path(vault_dir, required_folders))
)
pass <- report("Checking required folders...", checks) && pass

# --- Key files ---
key_files <- c("README.md", "SYSTEM_PROMPT.md", "LICENSE")
checks <- data.frame(
  label = key_files,
  pass = file.exists(file.path(vault_dir, key_files))
)
pass <- report("Checking key files...", checks) && pass

# --- Templates ---
templates <- list.files(file.path(vault_dir, "999_templates"), pattern = "\\.md$")
checks <- data.frame(
  label = "at least one template exists",
  pass = length(templates) > 0
)
pass <- report("Checking templates...", checks) && pass

# --- Frontmatter check ---
content_folders <- c("00_resources", "01_notes", "02_projects", "03_people", "99_tracking")
md_files <- unlist(lapply(content_folders, function(folder) {
  list.files(file.path(vault_dir, folder), pattern = "\\.md$",
             recursive = TRUE, full.names = TRUE)
}))

has_frontmatter <- vapply(md_files, function(f) {
  first_line <- readLines(f, n = 1, warn = FALSE)
  length(first_line) > 0 && first_line == "---"
}, logical(1))

checks <- data.frame(
  label = sub(paste0(vault_dir, "/"), "", md_files, fixed = TRUE),
  pass = has_frontmatter
)
pass <- report("Checking frontmatter...", checks) && pass

# --- Result ---
message("")
if (pass) {
  message("All checks passed.")
  quit(status = 0)
} else {
  message("Some checks failed.")
  quit(status = 1)
}
