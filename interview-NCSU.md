## 1. Please tell us about your interest in this position and how it aligns with your career objectives.

Values -> core motivation
* bring openness to research, and making it more inclusive and equitable

I view myself as primarily a problem solver
* leverage my experience and training to solve meaningful problems
* sometimes through working directly on data and code
* sometimes through teaching and instruction
* sometimes through coordinating groups to shift policies/infrastructure/resources

In terms of this position:
* primary draw is to build things that last - opportunity to work more directly with research teams on data and computational workflows
  - enjoy teaching and creating resources, but open source software is something I enjoy, and I am stretching to figure out how to incorporate more of that type of work in my responsibilities
* work at the intersection of various campus resources (IT, libraries, research integrity)

## 2. Please describe a time when you facilitated highly technical and research-specific consultations or meetings. What strategies did you use to communicate effectively with people with different levels of technical expertise? What challenges did you face?

https://www.ogrants.org/about.html

Open Grants discussion of metadata schema
* some folks are very familiar with data, data management, metadata, and what is a "schema"
* others are experts in grantmaking, users, instructors

How to get good feedback on a very technical document?
* my training in teaching and open projects focuses on pathways to contributing
* develop mechanism for turning someone's expertise into feedback
* set of instructions for thinking about using the end product (database of openly available grant proposals)
  - what would you want to search by (keyword, institution, author?)
  - if doing data analysis, what identifiers do you want to be included
  - how to look at existing schema to see if such a thing is there
  - provide feedback on adding fields or modifying existing fields
* communicate value of feedback (contributors need to have a value proposition - doesn't have to be compensation - but shared purpose or knowing their input will be used can be huge!)
* focus on the purpose of the interaction - we don't need everything to become an expert on the technical aspects or the user experience - figure out how to establish communications that we want in order to serve a purpose

## 3. The University is committed to inclusion and fostering a diverse and equitable educational environment and workplace. Can you talk about what this means to you? Or any examples of efforts you have taken to further your knowledge or engagement in these areas?

* supporting everyone who is interested and capable of doing the work (not gatekeeping based on background, and providing training and resources where needed and appropriate)
* guided by universal design for learning - empathic listening for what works and not just "it has always been done this way"
* training
  - understanding of implicit bias (and other cognitive biases) from graduate studies in psychology
  - bystander intervention training and code of conduct response training
  - ally skills and ally skills train-the-trainer (Sheila Addison / Frame Shift Consulting)
* systemic structures
  - privilege in being in workplace environments that are generally inclusive
  - code of conduct creation / HSCL mission statement & values
  - enforcement mechanisms (emphasize cultivating environment; only call campus police if there is an immediate safety issue)
  - equity conversations (JMLA chief editor call)
  - inclusion rider for invitations
  - budgeting for honoraria where possible

http://www.natsca.org/article/2681

## 4. Please briefly describe a specific example of a time when you worked collaboratively with multiple partners and stakeholders across departmental or institutional boundaries. What strategies did you use to build an effective collaboration with them?

https://docs.google.com/document/d/1YCo2H1mGnr0PnREwVqTCNnD9uzGcdRELGqU5PWh8CI0/edit?usp=sharing

* DMSP working group
* over 2 dozen contributors, mostly different institutions (some overlap when multiple people from the same institution)
* focus on value - working together on a common problem (shared burden, and collaborative) - work to get funding from NNLM and RDAP for honoraria
* make it EASY to contribute - dedicated facilitator roles, tracking documents, calendar invites, allow self-organization
* weekly calls alternating times
  - roll call at beginning, establish that the calls are participatory, not just listening in

## 5. Please share an experience of a project you contributed to that you eventually transitioned to someone else for long-term support. Can you tell us about any development techniques or tools and design considerations you may have used to ensure a smooth and sustainable handoff?

Two experiences, 1 successful, 1 not.

https://github.com/SugiharaLab/rEDM/
I created an R package during my PhD
* nearly all solo-development
* After I had left the lab, the PI pressured me to transfer ownership and CRAN maintainer status
* no discussion about governance or backwards compatibility for users
* code base was rewritten entirely
  - some functionality & interface changes
  - previous authors contributors were not all acknowledged
* not pleasant!

https://www.uf-carpentries.org/

~ late 2017, the UF Carpentries Club 
* initial board to formalize and handle responsibility from Matthew Collins (former sole organizer/coordinator)
* initial board decided organizational practices, and documentation
  - github organization and website
  - github wiki on workshop logistics, timing, contacts, sample messages, soliciting sponsors
  - code of conduct
  - workshop introduction materials
  - governance doc: procedures, elections, etc.
* I moved on after a few years on the board, and some practices have changed (especially with COVID), but having some other board members stay on, and documents already in place, keeps things running smoothly

## 6. Please describe a difficult or complex technical problem you've had to solve. What specific tools and/or approaches did you use in resolving it?

Recently, setting up a publicly-visible & searchable webpage of data management plans - https://example-dms-plans.github.io/examples/

* constraints:
  - public website
  - searchable
  - data drawn from a (private) google sheet
  - easily maintainable
* previous experience with github pages and flexdashboard
* using github actions to render and deploy the page (so re-build can be triggered without needing to run the code on one's own computer)
* one hurdle - getting access to controlled data on the google sheet
  - needed way to authenticate remotely
  - expected it was possible
  - dug into package documentations, available code
  - slowly tested individual steps to check functionality
  - using an encrypted access token
  - able to make all the code public and shareable, but only the automation service has the key to decrypt the token for access

## 7. This position could involve coordinating with different units on campus with their own unique expectations and timelines. How do you stay on top of competing priorities?

2 parts:
* communications and document project progress asynchronously through shared information
  - "working open" philosophy from Mozilla Open Leaders that resonates with reproducibility:
  - document status and updates in shared space (NOT email; challenges in offboarding and onboarding)
  - make important project information available for anyone to easily find and answer their questions without requiring direct contact (some training is necessary to get people familiar with this way of working - similar to taking IT ticket system but apply it to project management)
* problem solving / design thinking
  - identify goals and key constraints - work backwards
  - keep important goals and values in mind - document these! makes decisions easier later on when limitations arise
  - communicate changes transparently and when known
  - aspirational to Litany of Gendlin:
    > _What is true is already so.
    > Owning up to it doesn't make it worse.
    > Not being open about it doesn't make it go away.
    > And because it's true, it is what is there to be interacted with.
    > Anything untrue isn't there to be lived.
    > People can stand what is true,
    > for they are already enduring it.
  - conflict is scary, and avoiding it is an understandable response - impatient for progress, so that motivates me to be more transparent and direct when needed

## 8. What do you feel are some emerging research technologies that you would be interested in exploring in this role?

Automation is (maybe not emerging), but feels underused
* leverage what computers are good at (repetition) for quality control
* address reproducibility by requiring specification of requirements or a full workflow
[https://doi.org/10.1111/2041-210X.13982](https://doi.org/10.1111/2041-210X.13982)
[https://doi.org/10.1371/journal.pbio.3000125](https://doi.org/10.1371/journal.pbio.3000125)

Workflow specifications
* nothing new (e.g. make)
* newer versions in python (snakemake), R (targets), bioinformatics (CWL & nextfloweams)

(more on research end)
incremental publishing of artefacts (data, code, protocols, etc.)
* show history and progression of work
* richer citation data and acknowledgment of contributors
* combines with automation
* (more personally) that it breaks the stranglehold of journal publishers on manuscripts as the primary marker of output and prestige

## 9. What questions do you have for us?
* organizational structure / career development (currently TT faculty)
* future growth of department
  - in my role, we have some operations in this way, but it usually is on me and my colleagues to reach out to set up meetings and introduce how to work together, not as collabo
* remote/hybrid work
* hiring timeline