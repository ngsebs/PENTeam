# Mathematical Review Skill
# Guidelines for critical review of mathematical work

## Review Philosophy

- **Be skeptical of intuition** — verify everything
- **Be open to novelty** — don't reject new ideas prematurely
- **Focus on clarity** — obscure mathematics is often wrong mathematics
- **Constructive over destructive** — when rejecting, suggest improvements
- **Be thorough** — check every step, every assumption

## Review Checklist

### Correctness
- [ ] All logical steps are valid
- [ ] Definitions are precise and unambiguous
- [ ] Assumptions are clearly stated
- [ ] No hidden assumptions
- [ ] No circular reasoning
- [ ] Mathematical notation is used correctly

### Completeness
- [ ] All cases are covered
- [ ] Edge cases are addressed
- [ ] Proof is self-contained or clearly references external results
- [ ] No missing steps in logical chains
- [ ] Boundary conditions are handled

### Significance
- [ ] Result is novel or generalizes existing work
- [ ] Implications are interesting
- [ ] Result connects to broader mathematical context
- [ ] Applications are identified (if applicable)

### Presentation
- [ ] Notation is consistent and clear
- [ ] Structure is logical
- [ ] Another mathematician can follow the argument
- [ ] Terminology is standard or clearly defined

## Review Output Template

```markdown
## Review: [Theorem/Proof Title]

**Reviewer**: Senior Mathematician
**Date**: [Current date]
**Verdict**: [APPROVED | APPROVED WITH REVISIONS | REJECTED]

### Summary
[Brief one-paragraph assessment]

### Correctness Issues
- **[Critical/Minor]**: [Description]
  - Location: [Where in the proof]
  - Suggestion: [How to fix]

### Completeness Gaps
- [Description of missing cases or proofs]

### Significance Assessment
[Does this result matter? Why or why not?]

### Recommended Actions
1. [Specific revision request]
2. [Specific revision request]

### Positive Aspects
- [What the author did well]
```

## Counterexample Protocol

When finding a counterexample:

```markdown
## Counterexample Found

**Claim**: [The flawed statement]

**Counterexample**: [Concrete counterexample]
- Specific values: [Give concrete numbers]
- Computation: [Show the calculation]
- Result: [What happens]

**Why it fails**: [Explanation of the logical gap]

**Implication**: [The theorem needs revision or the claim is false]

**Suggested Fix**: [How to repair or restrict the theorem]
```

## Red Flags

Watch for these warning signs:

1. **Vague language**: "approximately", "almost", "very close"
2. **Hand-wavy arguments**: Skipping steps "obviously"
3. **Assumption drift**: Conditions changing mid-proof
4. **Special pleading**: "Except for this case" without justification
5. **Unreferenced results**: Using "well-known" without citation
6. **Notation overload**: Too many symbols without definition
7. **Circularity**: Using what you're trying to prove
8. **Base rate neglect**: Ignoring edge cases

## Review Process

1. **First read**: Get the overall picture
2. **Check definitions**: Are all terms defined?
3. **Trace logic**: Follow each step carefully
4. **Test with examples**: Verify with concrete cases
5. **Look for gaps**: Are all cases covered?
6. **Consider counterexamples**: Try to break it
7. **Assess significance**: Does it matter?
8. **Write review**: Be constructive and specific