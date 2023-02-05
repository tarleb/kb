---
tags:
  - Markdown
  - code
  - writer
---

## Banish the braces

Do you need Markdown code blocks to be written without braces and dots for
the language?

````` markdown
``` {.python}
print("hello")
```
`````

Use the extension `--to markdown-fenced_code_attributes` to show the language
without extra characters.

````` markdown
``` python
print("hello")
```
`````
