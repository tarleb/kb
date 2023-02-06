---
tags:
- gfm
- CommonMark
---

The parser for GitHub Flavored Markdown (gfm) is based on CommonMark as
well.

    pandoc --from=gfm ...

This is the format GitHub uses to render README files; it should be used
when producing such files from different formats:

    pandoc --to=gfm --output README.md ...

GitHub maintained a spec for their format, but the spec is not kept up
to date, unfortunately.

https://github.github.com/gfm/
