---
tags: []
---

## Organizing large documents

Large documents are easier to handle when split into smaller files.
Pandoc will treat multiple input files as if they were one long file.

    pandoc -o out.pdf intro.md methods.md

For extra convenience, define the order via filename prefixes,
e.g. `01-intro‍.md`, `02-methods‍.md`, and use the shell's globbing
feature:

    pandoc -o out.pdf *.md
