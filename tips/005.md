---
tags:
- Markdown
- Abbreviations
---

Markdown tip: pandoc prevents line breaks after certain abbreviations.
E.g. `Oct. 31` is treated as a single word, as pandoc replaces the
normal space char with a no-break space. View the default list with

``` bash
pandoc --print-default-data-file=abbreviations
```

Use custom abbrevs file with

``` bash
pandoc --abbreviations=...
```
