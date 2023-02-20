---
tags:
- Common mark
- attributes
- Markdown
---

Common mark allows to add attributes to all elements when the
`attributes` extension is enabled:

    {.fruit}
    - apple
    - banana

Pandoc doesn't support attributes on some elements (yet); this includes
lists. The attributes are attached to a wrapping div in those cases, so
the above is equivalent to this:

    ::: {.fruit}
    - apple
    - banana
    :::

The extension is enabled by default in "commonmark_x". Markdown
