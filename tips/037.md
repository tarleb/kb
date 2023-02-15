---
tags:
- language
- TeX
- LaTeX
- Markdown
- Org mode
- l10n
---

## Setting the document language

It is good practice to set the document language, e.g. via `lang`
metadata field on the command line

``` bash
pandoc -M lang=de-DE
```

This allows for proper hyphenation and other improvements;
e.g. headers in LaTeX PDFs will be localized, with translations
for "Figure", "Table of Contents" and similar labels. Or put it
directly into the doc; e.g. in Markdown one can use a YAML block

``` yaml
---
lang: es
---
```

and in Org mode

``` org
#+language: fr
```
