---
type: resource
title: Claude Tooling Overview
source_type: tool
tags:
  - ai
  - tooling
date_added: 2026-08-04
---

# Claude Tooling Overview

## Summary

Overview of the different ways to use Claude (Anthropic's LLM), what each is best suited for, and how they relate to each other.

## Tools

### Claude Code (CLI)
- Terminal-based agent with direct filesystem access
- Can read, write, and edit files; run shell commands; use git
- Context resets each session, but supports persistent memory files and hooks
- Best for: hands-on work in a codebase or file-based project
- Cost: usage-based via API key or Max subscription

### Claude.ai (web/app)
- Chat interface at claude.ai
- **Projects**: upload files as persistent context and set a system prompt — good for Q&A over a set of documents without giving filesystem access
- **Artifacts**: generates standalone documents, code, diagrams in a side panel
- No filesystem access, no command execution
- Best for: research, drafting, brainstorming, Q&A

### Claude Desktop App
- Native macOS/Windows app, same capabilities as claude.ai
- Supports **MCP (Model Context Protocol)** — connect Claude to external tools (file systems, databases, APIs) via local servers
- More setup than Claude Code for filesystem work, but more flexible for integrating multiple tools

### Claude API / SDKs
- Direct programmatic access for building custom tools or scripts
- Most flexible, most effort
- Best for: automating workflows, building tools that use Claude under the hood

## Key Takeaways

- Claude Code is the most capable option for working directly with local files and projects
- Claude.ai Projects is a lighter-weight complement for Q&A over documents
- MCP (via Desktop) is the extensibility layer for connecting Claude to arbitrary tools
- The API is for building your own integrations and automations

## Related

- **Projects:** [[PKM Vault]]
