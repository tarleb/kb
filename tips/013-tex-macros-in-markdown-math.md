---
tags:
- Markdown
- math
- macro
- TeX
---

## TeX macros in Markdown math

Pandoc Markdown respects `\newcommand` definitions in math formulæ,
independent of the chosen output format. The definition command can be
included in Markdown text, e.g.:

    \newcommand\rationals{\mathbb{Q}}

    We can prove that $\pi\not\in\rationals$.

Output with `pandoc -t plain`:

    We can prove that π ∉ ℚ.
