---
tags:
- Markdown
- East Asian
- CJK
---

## East Asian Line Breaks

Line breaks within paragraphs are usually treated as spaces in Markdown,
but this can give bad results when writing in an East Asian language.
Using `pandoc -f markdown+east_asian_line_breaks`{.bash} solves this, it
ensures that line breaks between East Asian wide characters get ignored.
