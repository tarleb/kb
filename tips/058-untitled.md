---
tags:
- Org mode
---

Org mode tip: use

    #+MACRO: myvar Replacement text

to define macros. Use them with

    {{{myvar}}}

Macros with arguments are possible, too:

    #+MACRO: greet Hello, $1!
    {{{greet(Mike)}}}

Pandoc supports this feature.
