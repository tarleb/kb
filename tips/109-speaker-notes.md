---
tags:
- Markdown
- beamer
- reveal.js
- PowerPoint
---

# Speaker Notes

Create speaker notes for slides by adding a "notes" div:

``` markdown
# Abbey Road
Here comes the sun

::: notes
And I say it's all right.
:::
```

Works as expected with pptx. In reveal.js use the speaker view by
pressing `s`. For beamer compile with `-V classoption=notes` to
get slides an notes on one page, or `-V classoption=notes=only` to
get just the notes.
