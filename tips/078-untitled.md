---
tags:
- docx
- odt
- reference doc
---

Reference docs allow to adjust the style of docx and odt files. Generate
a reference doc with

    pandoc -o refdoc.docx --print-default-data-file reference.docx

Open the refdoc.docx document and modify the styles in there to your
liking. Then pass the modified document to let pandoc use the new
styles:

    pandoc --reference-doc=refdoc.docx ...
