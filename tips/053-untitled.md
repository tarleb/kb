---
tags:
- TeX
- LaTeX
- PDF
- Markdown
- table
---

LaTeX PDF tip: When desired, disable the top and bottom rules of tables
with

    \renewcommand{\toprule}[2]{}
    \renewcommand{\bottomrule}[2]{}

The snippet can be placed in the header-includes or directly in
Markdown.

For pandoc versions before 2.18 use this instead:

    \let\toprule\relax
    \let\bottomrule\relax
