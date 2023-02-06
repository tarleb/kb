---
tags:
- Lua
- filter
- l10n
---

The pandoc-quotes filter by [\@odin][] adjusts quotation marks to fit the
document language. E.g. running the below

    ---
    lang: es
    ---
    "¡Hola!"

through `pandoc -L pandoc-quotes.lua -t plain` yields

    «¡Hola!»

The filter is available at https://github.com/odkr/pandoc-quotes.lua

[\@odin]: https://toot.cat/@odin
