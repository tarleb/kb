---
tags:
- Lua
- filter
- links
---

Pandoc Lua filter enforcing all *external* links to be opened in a new
tab:

``` lua
function Link (link)
  if link.target:match '^https?%:' then
    link.attributes.target = '_blank'
    return link
  end
end
```
