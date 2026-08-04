# Vault Retrospective

A periodic review of the PKM system itself — not the content, but whether the structure and workflows are serving you well.

## When to Run

Monthly or quarterly — whenever the system starts to feel like it's not quite fitting how you work.

## What to Look At

1. **Folder usage** — which folders have active content? Which are empty or neglected?
2. **Unprocessed notes** — how many items are sitting in `01_notes/` without being filed? Is the inbox backing up?
3. **Orphaned notes** — are there notes with no wikilinks to or from other notes?
4. **Template fit** — are you using the templates as-is, skipping sections, or working around them?
5. **Tracking effectiveness** — is the weekly tracking format useful? Are items rolling over too many times?
6. **Missing categories** — are you creating notes that don't fit any existing folder?
7. **Cross-linking health** — are projects linked to people? Are resources connected to projects?

## How to Run

1. Review the questions above — an LLM can help surface data (file counts, orphaned notes, link analysis) but you decide what matters.
2. Write a brief retrospective note in `01_notes/` capturing what's working, what isn't, and any changes to try.
3. Make structural changes (new folders, template tweaks, dropped conventions) and commit with a descriptive message.
4. Update `README.md` if the folder structure or workflow changes.

## Principles

- Small, incremental changes over big redesigns.
- If something isn't being used, consider removing it rather than trying harder to use it.
- The best system is the one you actually maintain.
