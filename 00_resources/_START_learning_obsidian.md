---
type: resource
title: Learning Obsidian
source_type: tool
tags:
  - obsidian
  - tooling
date_added: 2026-09-07
---

# Learning Obsidian

## Summary

Notes on Obsidian features, settings, and keyboard shortcuts relevant to how this vault is used — wikilinks, templates, and the Templater plugin.

## Key Takeaways

- Wikilinks (`[[Note Name]]`) create/link notes by name; link text must exactly match the target file name (case, spelling, spacing) or clicking it in reading mode will create a new blank note instead of opening the existing one.
- "Default location for new notes" (Settings → Files & Links) controls where a new note lands when created via an unresolved wikilink — currently set to "Vault folder" (root), not the topically relevant folder.
- Templater's folder templates (Settings → Templater → Folder Templates) auto-apply a template only when a note is *created directly inside* the mapped folder (e.g. `03_people` → `person.md`) — not when a note is later moved into that folder.
- If Obsidian seems to show a stale/broken link after editing file names, relaunching Obsidian (or rebuilding the vault cache) resolves it.

## Keyboard Shortcuts

| Action | Shortcut |
|---|---|
| Open Quick Switcher | `Cmd+O` |
| Insert wikilink | `[[` |
| Command palette | `Cmd+P` |
| Templater: Open Insert Template modal | *not bound by default* |

## TODO

- [ ] Set up a keyboard shortcut for "Templater: Open Insert Template modal" (Settings → Hotkeys → search "Templater") so a template can be manually applied to a note after creation/move, without relying on folder-based auto-apply.

## Related

- **Projects:** [[]]
- **People:** [[]]
- **Resources:** [[]]
