---
tags:
- filter
- Quarto
- Quarto extension
---

New pandoc filter / quarto extension: run-lua, a filter to evaluate
small Lua snippets embedded in the document. E.g.

    Built with pandoc <?lua PANDOC_VERSION?>

or with Quarto

    Generator: Quarto <?lua quarto.version?>

https://github.com/pandoc-ext/run-lua
