---
tags:
- Markdown
- identifier
- i18n
- attributes
---

## Attributes

Pandoc's Markdown supports attributes on headings, code, spans, etc.
Attributes are enclosed by curly braces and follow this syntax:

    {identifier-value .class-one .class-two some-key="a value"}

Attributes can define an internal cross-ref target and carry a variety
of additional information about the element, e.g. language or styling.

    peace: [שָׁלוֹם]{lang="he" dir="rtl"}
