---
tags:
- Lua
- filter
- BibTeX
- BibLaTeX
---

Do you maintain one big BibLaTeX database? Get the subset of just those
entries required for an article with

```
pandoc -L getbib.lua paper.md -t biblatex -o paper.bib
```

where `getbib.lua` contains

``` lua
function Pandoc (doc)
  doc.meta.references = pandoc.utils.references(doc)
  doc.meta.bibliography = nil
  return doc
end
```
