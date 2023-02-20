---
tags:
- TeX
- LaTeX
- PDF
- Lua
- filter
---

## Parsing embedded LaTeX

There are situations where our primary target is LaTeX (for PDF), but
we still need decent output in different formats. The below Lua filter
will parse all raw LaTeX snippets when converting to different formats,
so even a carefully crafted LaTeX table embedded into Markdown will show
up in HTML output. pandoc filter Lua lang
https://github.com/tarleb/parse-latex
