---
tags:
- custom reader
---

## Syntax-highlighted code files

Custom Lua readers allow to support additional formats, and other
interesting features. Here's one converting code files to
syntax-highlighted docs.

``` lua
function to_cb (s)
  local _, lang = pandoc.path.split_extension(s.name)
  return pandoc.Div{
    pandoc.Header(1, s.name == '' and '<stdin>' or s.name),
    pandoc.CodeBlock(s.text, {class=lang}),
  }
end
function Reader (input)
  return pandoc.Pandoc(input:map(to_cb))
end
```

Usage: `pandoc -f src.lua -o out.docx`

https://pandoc.org/custom-readers
