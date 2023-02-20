---
tags:
- Markdown
- reStructuredText
- line blocks
---

Line block syntax in pandoc's Markdown is borrowed from
reStructuredText: each line is prefixed with a pipe character and a
space. It can be used for line-oriented text such as addresses or poems.

    | One Ring to rule them all, One Ring to find them,
    | One Ring to bring them all and in the darkness bind them.

The main difference to other methods of handling line-oriented contents
is that line blocks convert leading spaces into non-breaking spaces,
thereby preserving indentation.


https://pandoc.org/MANUAL.html#line-blocks
