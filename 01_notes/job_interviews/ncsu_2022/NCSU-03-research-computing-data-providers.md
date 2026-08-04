---
type: note
title: NCSU 03 Research Computing Data Providers
date: 2022
tags:
  - interview
---

## Context
This 45-minute session is an opportunity for you to discuss a technical project with a small group, composed of various cross-campus research computing and data employees with whom this position would likely intersect.

Our hope is that this will be more of a discussion than a presentation, and you can choose whether you would like to walk us through your experience and address the questions below along the way, or have us ask you the questions explicitly, like a traditional interview. Please prepare in enough depth to discuss the questions for ~20 minutes, and the remaining time will be used to ask questions as we go; you are free to ask us questions, too. Focus on answering the primary questions and use the italicized follow-up questions as a guide for your thinking. This is your opportunity to talk to a more technical audience and highlight your expertise and experience.

## Prompt
Tell us about a time you were able to automate a process that was time-consuming to accomplish manually, or about a time you were able to improve the efficiency of a process that was already lightly automated. 

https://github.com/uf-repro/lesson-template

### What was the process you were trying to improve?
* creation and publishing of lesson materials
* goals:
  - write materials in markdown (or similar) - open and maintainable
  - publish to a website, with effective design and all content linked
  - easy to do basic customization (appearance)
  - version control

### How did you go about understanding the problem space? 
* establish goals up-front
  - if necessary, prioritize or identify needs vs. wants (but can revisit with sample solutions)
* identify existing UF implementations (libguide, uf-library wordpress, university hosting)
* identify open-source implementations (reached out to twitter network for examples)
* other issues revealed through creation and iteration process
  - automate conversion of slide content into notes
  - keep slide rendering through pkgdown process (assets field of `_pkgdown.yml`)
  - use "single source of truth" for lesson metadata
 
### Walk us through the architecture of your solution. 
*Is it in a framework?*
*Is it object-oriented?*
*Is it procedural code?*
*Why did you choose the structure you did?*
*What security implications did you consider in the architecture design?*
*Would you do something differently next time?*

* Rstudio project for an R package
* `{{pkgdown}}` builds the website
  - `_pkgdown.yml` is the config file
* github actions renders and publishes to github pages
  - `.github/workflows/pkgdown.yaml` is the workflow script
* `{{RMDconverter}}` is a custom R package for converting slide contents into notes
  - https://github.com/ha0ye/RMDconverter
* `README.Rmd` sets lesson metadata
  - writes to `DESCRIPTION` file
  - writes to `.zenodo.json` file

WHY
* procedural code - rendering README.Rmd updates other necessary files (common task already, so does not create additional burden in terms of workflow)
* security implications - none, open materials
  - using github pages hosting (no university security review) lets me change or add new websites as needed


### How did you determine what technologies (languages, libraries, frameworks, etc.) to use? Things to consider addressing: 
*How have those decisions held up over time?*
*Would you choose something different now? Why or why not?*

* uses existing frameworks and tooling
  - I don't have to maintain a lot
  - some updates to github actions workflows, nothing broken so far, so benefits to looking into updates seem minimal (may speedup caching of dependencies for future builds)

* biggest consideration is further separation of content and operations
  - changes to the workflow -> work to propagate across existing lesson repos
    (e.g. updating lesson metadata workflow and figure captions / alt-text in slides)
  - not that many copies
  - no prior data schema -> coming up with one for future-proofing would have been lots of work (not sure it would have been worth it in this context, but could be considered)

### How did you ensure that someone else could use or build on your solution in the future?

* all open-source and on github
* after first few examples, created template repository with sample content
  - easier to copy and modify

