---
tags:
- TeX
- ConTeXt
- typesetting
- PDF
---

ConTeXt is an advanced typesetting system based on TeX; it's the
preferred system of many professional typesetters. Pandoc can convert to
ConTeXt markup with `--to=context` and generate PDF files via ConTeXt
with `--pdf-engine=context`. The system makes it possible to generate
accessible, tagged PDFs, which is otherwise difficult to do:

    pandoc --pdf-engine=context -V pdfa=3a ...

ConTeXt in the fediverse:
[@context@fosstodon.org](https://fosstodon.org/context).
