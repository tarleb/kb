---
tags:
- reStructuredText
- Markdown
- format extension
---

reStructuredText allows to use a hash symbol instead of a number in
ordered list markers:

``` rst
#. this
#. that
```

Pandoc's Markdown supports this syntax as well via the `fancy_lists`
extension; it is enabled by default.
