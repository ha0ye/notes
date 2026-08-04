# Personal Knowledge Management Vault

A personal knowledge management system built on Obsidian and plain markdown. This vault is a meta-layer for planning, connecting, and discovering across projects and people. Actual project work typically happens in separate project folders/repos; this vault holds notes *about* them. Small, self-contained projects that don't require their own repo, infrastructure, or non-markdown files can live directly in the vault.

## Design Principles

- **Markdown-first:** All content is plain markdown. Obsidian-specific features (wikilinks, tags, frontmatter) are used where they add value, but files remain readable and editable without Obsidian.
- **LLM-assisted, not LLM-dependent:** LLMs help with organizing and scaffolding. The system works fully without LLM access.
- **Progressive refinement:** Notes scaffold into larger projects. Ideas mature into plans, plans export into working project folders.
- **Cross-linkable knowledge:** Everything lives in one vault so connections are discoverable via wikilinks and backlinks.
- **Evolving system:** The vault includes periodic self-review and is expected to change based on what's working and what isn't.

## Folder Structure

```
_workflows/      # Scripts and workflow definitions that operate on the vault (not content)
00_resources/    # Articles, tools, frameworks, readings worth retaining
01_notes/        # Scratch, meetings, ideas, anything unprocessed — the inbox
02_projects/     # Notes about projects — goals, status, decisions, links to actual project repos
03_people/       # Collaborators, stakeholders — contact info, expertise, motivations
999_templates/    # Reusable scaffolds for new projects or note types
99_tracking/     # Weekly task lists and work logs — feeds downstream reports
```

- Numbered prefixes control sidebar ordering in Obsidian.
- The underscore prefix on `_workflows/` signals tooling, not content.
- File and folder names use underscores instead of spaces.
- Any content folder can have an `archive/` subfolder for inactive items you want to keep. Create as needed — not every folder needs one upfront. Archived items retain the format and AI policy of their parent folder.

## Workflow

1. **Capture** — scratch notes, meeting notes, ideas, and contacts land in `01_notes/` first
2. **Process** — notes get filed into the appropriate folder (projects, people, resources) or stay as seeds
3. **Connect** — wikilinks, tags, and frontmatter create relationships between notes
4. **Plan** — project notes mature with goals, decisions, and stakeholder links
5. **Track** — weekly task lists in `99_tracking/` manage ongoing work with rollover of incomplete items
6. **Scaffold** — templates generate starter documentation for new projects
7. **Export** — scaffolded docs are copied/output to the actual project folder when work begins
8. **Report** — a script scrapes raw tracking data for a time period; a separate project handles deduplication and LLM-assisted report drafting
9. **Learn** — insights and learnings from active projects are captured back into the vault

## AI Policies by Folder

| Folder | AI Policy | What AI Does | What AI Doesn't Do |
|---|---|---|---|
| `00_resources/` | **Assisted** | Suggest and summarize in chat | Write/modify files directly |
| `01_notes/` | **Voice-preserved** | — | Touch content |
| `02_projects/` | **Collaborative** | Draft, update, restructure | — |
| `03_people/` | **Collaborative** | Organize, format provided info into fields | Generate content without input |
| `999_templates/` | **Collaborative** | Build and refine scaffolds | — |
| `99_tracking/` | **Voice-preserved** | — | Touch content |

**Policy definitions:**
- **Voice-preserved:** AI does not modify or act on content in these files. The user's words stay as written.
- **Assisted:** AI helps in conversation (suggesting, summarizing, answering questions) but does not write or modify files without explicit user action.
- **Collaborative:** AI can draft, update, and restructure content directly, but does not fabricate information beyond what the user has provided.

## Relationship to Project Repos

Most projects live in their own repos for real work. Small, self-contained projects (no infrastructure, no non-markdown files) can live directly in the vault.

```
~/projects/
  app-x/              # actual project repo (git)
  website-y/          # actual project repo (git)

~/pkm/                # this vault (git)
  02_projects/
    app-x.md          # notes about app-x
    website-y.md      # notes about website-y
```

## Using Obsidian

### Wikilinks

Type `[[` and start typing a note name — Obsidian auto-completes from all files in the vault. A wikilink like `[[alice]]` in a project note creates a clickable link to `03_people/alice.md`. You don't need to know or type file paths.

Use wikilinks whenever you mention a person, project, or resource by name. This is what builds the relationship graph across your vault.

### Backlinks

Open any note and the backlinks panel (right sidebar) shows every other note that links to it. If you open `alice.md`, you'll see every project, note, and resource that mentions `[[alice]]`.

This is the main discovery mechanism. You don't need to manually maintain lists like "Alice is on projects X, Y, Z" — backlinks do it automatically from your wikilinks.

### Frontmatter

The YAML block between `---` markers at the top of each template is frontmatter — structured metadata that Obsidian reads but doesn't display in the note body.

```yaml
---
type: project
status: active
tags:
  - project
collaborators: []
---
```

Frontmatter makes files queryable and sortable by status, type, date, etc. It's also plain text, so LLMs and scripts can parse it directly.

### Tags

Lightweight labels added in frontmatter or inline in text (e.g., `#project`, `#meeting`). Obsidian's tag pane shows all tags in the vault and lets you click to find every note with a given tag. Simpler than frontmatter when you just need quick categorization.

### Folders and Sidebar

The sidebar shows your folder tree. Numbered prefixes (`00_`, `01_`, etc.) control the ordering. You can drag files between folders — useful for processing notes from `01_notes/` into their destination.

### Dataview Plugin (Optional)

An Obsidian community plugin that lets you write queries against frontmatter across files. For example, a live table showing all projects where `status: active`, or all people with a specific expertise tag. Without Dataview, the vault works fine using search and backlinks.

### The Practical Loop

1. Write a note
2. Add `[[wikilinks]]` to people, projects, and resources as you mention them
3. Obsidian's backlinks automatically build the relationship graph
4. Frontmatter and tags make things searchable and filterable

That's the core. Everything else is optional.

## Version Control

This vault is tracked with git and synced via GitHub for cross-device access. Commit before any major structural change — version control gives you the freedom to experiment without fear of losing anything.

## Tooling

- **Editor:** Obsidian
- **Format:** Markdown with Obsidian extensions (wikilinks, frontmatter, tags)
- **Storage:** Local filesystem
- **Version control:** Git + GitHub
- **LLM support:** Claude and other LLMs can read/organize markdown files directly

## License

This vault is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/). Informed by the [Obsidian Scientist Knowledge Template](https://github.com/ilennaj/obsidian-scientist-knowledge-template) by Ilenna Jones (also CC BY 4.0).
