---
tags:
- Markdown
---

Appending `{target=_blank}` to a pandoc Markdown link ensures that a new
tab will be opened when the link is clicked.

``` markdown
[manual](https://pandoc.org/MANUAL){target="_blank"}
```

Add the below to the document's header-includes to enable this behavior
for all links:

``` html
<base target="_blank" />
```
