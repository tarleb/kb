---
tags:
- Markdown
- format extension
---

Markdown ATX-style headings, i.e. those marked by one or more hash
signs, should always have a space between marker and text.

``` markdown
# Intro
```

Pandoc enforces this space by default, but can be "convinced" to accept
the space-less variant

``` markdown
#​Intro
```

by disabling the `space_in_atx_header` extension:

    pandoc --from=markdown-space_in_atx_header
