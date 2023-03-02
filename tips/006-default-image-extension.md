---
tags:
- image
- pdf
- svg
- Markdown
---

## Default image extension

If you generate figures in multiple formats and want to choose the
format best suited for the target, using the
`--default-image-extension` command line parameter will allow you
to set your desired format. For example,  if you export an image
as both pdf and svg, then you can write this Markdown
`![caption](my-figure)`{.markdown} and run pandoc with `pandoc
--to=html --default-image-extension=svg`{.bash} or `pandoc
--to=latex --default-image-extension=pdf`{.bash}.

