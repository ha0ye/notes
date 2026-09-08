# Copilot Instructions — PKM Vault

This is a personal knowledge management (PKM) vault built on Obsidian and plain markdown — not a software project. There is no build, test, or lint tooling to run for content changes.

**Read `SYSTEM_PROMPT.md` first.** It is the authoritative, detailed guide for how AI assistants should work in this vault (AI policies per folder, working style, conventions). `README.md` has the full system description for human readers. This file is a short pointer for Copilot; do not let it drift out of sync with `SYSTEM_PROMPT.md` — if a conflict arises, `SYSTEM_PROMPT.md` wins.

## Critical rules (see SYSTEM_PROMPT.md for full detail)

- **AI policy per folder is enforced, not optional:**
  - `01_notes/` and `99_tracking/` are **voice-preserved** — never modify, reorganize, or summarize their content.
  - `00_resources/` is **assisted** — discuss/summarize in chat, but don't write or modify files without explicit user action.
  - `02_projects/`, `03_people/`, `999_templates/` are **collaborative** — direct edits allowed, but never fabricate content the user hasn't provided.
  - Archived items (`*/archive/`) retain their parent folder's policy.
- **Scope discipline:** only change what was explicitly requested; don't expand into unrelated reorganization or audits.
- **No silent config changes:** never add permissions, hooks, or persistent config without explicit approval.
- **Confirm before acting** on loosely defined requests — restate the plan first.

## Conventions

- Underscores instead of spaces in file/folder names (exception: `03_people/` notes may use spaces).
- New notes should follow the scaffolds in `999_templates/`.
- Frontmatter (YAML at top of file) should be minimal and non-redundant.
- Use `[[wikilinks]]` when referencing a specific person/project/resource note; use tags for categorization.
- This vault holds notes *about* projects/people, not the project work itself — actual project code lives in separate repos.

## Structure

```
_workflows/      # scripts/workflows operating on the vault (tooling, not content)
00_resources/    # articles, tools, frameworks (assisted)
01_notes/        # inbox: scratch, meetings, ideas (voice-preserved)
02_projects/     # project planning notes (collaborative)
03_people/       # collaborators/contacts (collaborative)
999_templates/   # note scaffolds (collaborative)
99_tracking/     # weekly task lists (voice-preserved)
```

## Verification

There's an R script that checks vault structure and frontmatter presence:

```
Rscript _workflows/verify_vault_structure.R
```

Run it after structural changes (new required folders, renamed key files) or when adding/editing frontmatter across content folders.
