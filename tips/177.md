---
tags:
- BibLaTeX
- CSLJSON
- Zotero
- CSL
---

One can document the access date of a referenced URL with the `urldate`
key in BibLaTeX or the `accessed` field in CSLJSON. E.g. in BibLaTeX:

    @online{pandoc,
      title = {Pandoc manual},
      url = {https://pandoc.org/MANUAL%7D,
      date = {2022},
      urldate = {2023-01-03}
    }

Not all citation styles make use of this info, but "author-date" styles
do. The Zotero CSL style database can be filtered for those; pick the
one you want here: https://www.zotero.org/styles?format=author-date
