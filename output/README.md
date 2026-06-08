# Output Directory

This directory contains results from completed investigations.

## Structure

Results are organized by project:

```
output/
├── [project-name]/
│   ├── summary.md          # Executive summary of findings
│   ├── theorems/           # Proposed theorems and proofs
│   │   ├── theorem-001.md
│   │   └── theorem-002.md
│   ├── implementation/     # Python code implementations
│   │   └── *.py
│   ├── tests/              # Test suites and results
│   │   └── test_*.py
│   ├── review/             # Senior mathematician reviews
│   │   └── review-*.md
│   └── artifacts/          # Additional outputs (plots, data, etc.)
```

## Naming Convention

- Use lowercase kebab-case for project directories
- Include date in summary filenames: `YYYY-MM-DD-summary.md`
- Version theorems: `theorem-NNN-vN.md`