---
tags:
- reStructuredText
- Lua
- filter
- rst
- underline
---

## Underline with reStructuredText

reStructuredText follows the logic that underlined text means that it's
a link, so it doesn't have dedicated syntax for (non-link) underlined
text either. Support can be added with this syntax

    .. role:: underline
        :class: underline

    :underline:`this`

in combination with a short Lua filter

    function Span(s)
      return s.classes[1] == 'underline' and pandoc.Underline(s.content) or nil
    end
