---
type: resource
title: Science Repository Layout Pattern
url: https://github.com/j6k4m8/science-repos
source_type: framework
tags:
  - reproducibility
  - project_structure
  - computational_science
date_added: 2026-08-03
---

# Science Repository Layout Pattern

A standardized layout for computational science project repos, focused on reproducibility and clear provenance. By Jordan Matelsky.

- Repo: https://github.com/j6k4m8/science-repos
- Blog post: https://blog.jordan.matelsky.com/Scientific-repositories/
- Demo repo: https://github.com/j6k4m8/scientific-repo-demo

## Core Layout

```
data/
  raw/              # untouched external inputs (downloaded datasets, exports)
  provided/         # stable project-supplied inputs (reference tables, metadata)
  generated/        # intermediate outputs from code (filtered, merged, normalized)
analysis/
  <rule_name>/run.py  # one entrypoint per workflow step
src/                # shared reusable Python code
results/
  data/             # final tables for interpretation
  figures/          # final manuscript-ready figures
Snakefile           # workflow DAG definition
```

## Key Principles

- **Separate provenance from interpretation** — raw inputs, intermediates, and final outputs each have a clear home
- **Separate workflow steps from reusable code** — `analysis/` has thin entrypoints, `src/` has shared logic
- **Use workflow DAGs** (Snakemake) to make flows reproducible and rebuildable
- **Decision rule for placement:** if it's an intermediate needed by another step, it goes in `data/generated/`; if someone would open it to understand the science, it goes in `results/`

## Useful Details

- **`protected()`** in Snakemake marks expensive outputs as write-protected after generation
- **Figure conventions:** size figures to final manuscript width (6.5" for full-width), generate programmatically in PDF/SVG
- **`_results.tex` pattern:** write computed values from code into LaTeX `\newcommand` definitions so papers reference live data, not hardcoded numbers
- **Optional `paper/` submodule** with `paper/generated/figures/` and `paper/generated/tables/` for manuscript assets

## When to Use

When scaffolding a new computational science project from the PKM vault. This pattern applies to repos in `~/projects/` — not to the vault itself.
