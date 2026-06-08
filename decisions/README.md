# Decisions Directory

This directory stores all decisions that require involvement of the Project Owner, kept separate for clear audit trail and prioritization.

## Structure

```
decisions/
├── pending/
│   └── [project-name]/
│       ├── decision-001.md
│       └── ...
├── approved/
│   └── [project-name]/
│       ├── decision-001.md  # With approval timestamp
│       └── ...
├── rejected/
│   └── [project-name]/
│       ├── decision-001.md  # With rejection reason
│       └── ...
└── template.md
```

## Decision Format

```markdown
# Decision Record: [Decision Title]

**Decision ID**: DEC-[PROJECT]-[NUMBER]
**Project**: [Project Name]
**Date Created**: [Date]
**Status**: [Pending | Approved | Rejected | Deferred]

## Decision Summary
[One-paragraph summary of the decision needed]

## Background
[Why is this decision needed? What triggered it?]

## Decision Details
[Detailed description of what is being decided]

## Options

### Option A: [Name]
**Description**: [What this option entails]
**Pros**:
- [Pro 1]
- [Pro 2]
**Cons**:
- [Con 1]
- [Con 2]

### Option B: [Name]
**Description**: [What this option entails]
**Pros**:
- [Pro 1]
- [Pro 2]
**Cons**:
- [Con 1]
- [Con 2]

## Analysis
[Analysis of options, risks, trade-offs]

## Recommendation
[Supervisor's recommendation with rationale]

## Required From Project Owner
- [ ] Approval to proceed
- [ ] Selection of preferred option
- [ ] Additional information needed
- [ ] Other: [Specify]

## Response

**Decision**: [Option A / Option B / Deferred]
**Approved By**: [Project Owner Name]
**Date**: [Date]
**Comments**: [Any comments or conditions from Project Owner]

## Implementation Notes
[How this decision affects project execution]
```

## Usage Guidelines

1. **Create new decision** → Add to `pending/[project]/`
2. **Project Owner reviews** → Move to `approved/` or `rejected/` with response
3. **Track all owner decisions** → Never decide without explicit owner approval
4. **Reference in threads** → Link decision IDs in communication threads