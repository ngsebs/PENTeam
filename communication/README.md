# Communication Directory

This directory maintains the main discussion protocol and threads between all team members including the Project Owner.

## Structure

```
communication/
├── threads/
│   ├── [project-name]/
│   │   ├── thread-001.md   # Main discussion thread
│   │   ├── thread-002.md   # Sub-threads as needed
│   │   └── ...
├── protocol/
│   └── [project-name]-protocol.md  # Meeting notes, decisions made
├── owner-references/
│   └── [project-name]-ref-*.md     # Questions/inputs escalated to Project Owner
└── archive/
    └── [archived-project]/        # Completed project communications
```

## Thread Format

```markdown
# Discussion Thread: [Topic]

**Project**: [Project Name]
**Started**: [Date]
**Status**: [Active | Resolved | Archived]

## Participants
- [Role]: [Status - Active/Contributing/Completed]

## Messages

### [Date] - [Role]
**Subject**: [Brief subject line]

[Message content]

---

### [Date] - [Role]
**Subject**: [Brief subject line]

[Message content]
```

## Protocol Format

```markdown
# Communication Protocol: [Project Name]

**Project**: [Project Name]
**Last Updated**: [Date]

## Participants
| Name | Role | Status |
|------|------|--------|
| [Name] | Supervisor | Active |
| ... | ... | ... |

## Key Decisions
| Date | Decision | Made By | Approved By |
|------|----------|---------|-------------|
| YYYY-MM-DD | [Description] | [Role] | [Role/Owner] |

## Open Items
- [ ] [Item] - Assigned to: [Role]

## Resolved Items
- [x] [Item] - Resolution: [Summary]
```

## Owner Reference Format

Questions or inputs that require Project Owner involvement:

```markdown
# Project Owner Reference: [Topic]

**Project**: [Project Name]
**Date**: [Date]
**Escalated By**: [Role]

## Question/Input
[Clear description of what needs Project Owner decision or input]

## Context
[Background information needed to make decision]

## Options Considered
1. [Option A] - Pros/Cons
2. [Option B] - Pros/Cons

## Recommendation
[Supervisor's recommendation if applicable]

## Response Required By
[Date if time-sensitive]
```