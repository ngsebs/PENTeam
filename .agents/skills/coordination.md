# Project Coordination Skill
# Guidelines for orchestrating multi-agent mathematical research

## Directory Operations

### Reading Project Descriptions
When a new project is submitted to `/app/input/`:
1. Read and validate the project description
2. Check for required fields (problem statement, goals, success criteria)
3. Note any constraints or deadlines

### Creating Project Structure
For each new project, create:
```
/app/output/[project-name]/
├── summary.md           # Executive summary
├── theorems/            # Proposed theorems
│   └── *.md
├── review/              # Review documents
│   └── *.md
├── implementation/      # Python code
│   └── *.py
├── tests/               # Test suites
│   └── test_*.py
└── artifacts/           # Additional outputs
```

### Initializing Communication
Create thread file: `/app/communication/threads/[project-name]/thread-001.md`

## Task Delegation Format

```markdown
## Task Assignment

**Project**: [Project Name]
**Task ID**: TASK-[PROJECT]-[NUMBER]
**Task**: [Description of task]
**Assigned To**: [Team Member Role]
**Context**: [Previous work, constraints, expectations]
**Deliverable**: [Expected output and location]
**Priority**: [High/Medium/Low]
**Created**: [Date]
```

## Progress Tracking

### Status Codes
- `pending` - Task created, not started
- `in_progress` - Work underway
- `blocked` - Waiting on dependencies or decisions
- `review` - Awaiting review
- `completed` - Finished and verified
- `cancelled` - Task cancelled

### Update Format
When updating progress:
```markdown
## Task Update

**Task ID**: TASK-XXX
**Status**: [New status]
**Updated By**: [Role]
**Date**: [Date]

**Notes**:
[What was done, any issues, next steps]
```

## Decision Escalation

### When to Escalate
Escalate to Project Owner when:
- Theorem claims have significant implications
- Resource allocation is needed
- Scope changes are proposed
- Multiple valid approaches exist and choice affects outcomes
- Any unilateral decision could have high impact

### Decision Record Format
```markdown
# Decision Record: [Decision Title]

**Decision ID**: DEC-[PROJECT]-[NUMBER]
**Project**: [Project Name]
**Date Created**: [Date]
**Status**: [Pending | Approved | Rejected | Deferred]

## Decision Summary
[One-paragraph summary]

## Background
[Why is this needed?]

## Options

### Option A: [Name]
**Pros**: [List]
**Cons**: [List]

### Option B: [Name]
**Pros**: [List]
**Cons**: [List]

## Recommendation
[Supervisor's recommendation]

## Required From Project Owner
- [ ] Approval to proceed
- [ ] Selection of preferred option
```

## Project Owner Communication

### Escalation Format
When requesting Project Owner input:
```markdown
# Project Owner Reference: [Topic]

**Project**: [Project Name]
**Date**: [Date]
**Escalated By**: [Role]

## Question/Input
[Clear description]

## Context
[Background needed]

## Options Considered
1. [Option A] - Pros/Cons
2. [Option B] - Pros/Cons

## Recommendation
[If applicable]

## Response Required By
[Date if time-sensitive]
```

## Output Summary Template

```markdown
## Research Summary

**Project**: [Project Name]
**Status**: [In Progress | Completed | Blocked]
**Completion Date**: [Date]

### Key Findings
- [Finding 1]
- [Finding 2]

### Theorems Proposed
| ID | Title | Status |
|----|-------|--------|
| THM-001 | [Title] | [Proposed/Approved/Rejected] |

### Implementation
- Functions implemented: [Count]
- Lines of code: [Count]
- Test coverage: [Percentage]

### Tests
- Total tests: [Count]
- Passed: [Count]
- Failed: [Count]

### Decisions Made
| ID | Decision | Outcome |
|----|----------|---------|
| DEC-001 | [Description] | [Approved/Rejected] |

### Next Steps
- [ ] [Next action 1]
- [ ] [Next action 2]

### Open Questions
- [Question 1]
- [Question 2]
```