---
tags:
- Lua
- filter
---

If images become too deeply nested, use `--extract-media=.` and/or apply
this Lua filter:

``` lua
local pattern = '^media/(.*)'

for fp, mt, contents in pandoc.mediabag.items() do
  pandoc.mediabag.delete(fp)
  pandoc.mediabag.insert(fp:match(pattern), mt, contents)
end

function Image (img)
  img.src = img.src:match(pattern)
  return img
end
```

