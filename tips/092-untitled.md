---
tags:
- reStructuredText
- metadata
---

The reStructuredText reader is unusual in that it switches behavior when
pandoc is called with `-s` or `--standalone`: In that case, definitions
at the start of the document get treated as metadata.

    :title: My Document
    :author: Jane Doe
    :date: 2023-01-05

Without `--standalone`, that data is treated as part of the main
document and parsed as a definition list.
