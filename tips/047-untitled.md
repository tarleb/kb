---
tags:
- Markdown
- CLI
---

The oldest Markdown syntax for code blocks, that is also the best
supported across different md implementations, uses 4 space indentation,
e.g.

``` markdown
Assign a variable

    a = 10
```

There is no md syntax to specify the language for these blocks, but
setting the cli parameter `--indented-code-class=python` marks all such
blocks in a document as python code, thereby enabling syntax
highlighting.
