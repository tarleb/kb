---
tags:
- image
- pdf
- svg
- Markdown
---

## Default image extension

Can you generate your figures in multiple formats and want to always use
the format that's suited best for the target? Omit the file extension
from the image path and use `--default-image-extension`. E.g., if you
export an image as both pdf and svg, then you can write this Markdown
`![caption](my-figure)`{.markdown} and run pandoc with `pandoc --to=html
--default-image-extension=svg`{.bash} or `pandoc --to=latex
--default-image-extension=pdf`{.bash}.
