---
title: Tagged PDFs via ConTeXt
tags:
  - ConTeXt
  - PDF
  - accessibility
---

Pandoc 3.0 comes with a new ConTeXt extension for improved PDF tagging:

``` bash
pandoc --to=context+tagging -V pdfa -o out.pdf
```

This will produce "tagged" output, i.e. the PDF file contains structured
text that is easier to process by accessibility tools.

ConTeXt output is tagged with and without the new "tagging" extension,
but what's new and important is that the output gets optimized for
tagging, resulting in much better results for paragraphs and emphasized
text.
