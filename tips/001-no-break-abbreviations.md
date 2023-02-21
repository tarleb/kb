---
tags:
- Markdown
- Abbreviations
---

## No-break abbreviations

Markdown tip: pandoc prevents line breaks after certain
abbreviations. For example, in order to treat `Oct. 31` as a
single word, pandoc replaces the normal space character with a
no-break space. 

To view the complete list of default abbreviations which use
no-break spaces, use

``` bash
pandoc --print-default-data-file=abbreviations
```

If you want to set custom abbreviations, create a file with

``` bash
pandoc --abbreviations=...
```
