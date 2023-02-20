---
tags:
- syntax highlighting
- code
---

## Syntax highlighting

Pandoc performs syntax highlighting for 148 different markup- or
programming languages. To see the complete list, use `pandoc
--list-highlight-languages`. Not every language is supported by
default; to add a language yourself,

1. check [https://kate-editor.org/syntax/](https://kate-editor.org/syntax/)
2. download the definition
3. pass it to pandoc via the `--syntax-definition` option.
