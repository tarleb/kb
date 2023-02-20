---
title: Prevent automatic addition of header-block
tags:
  - metadata
  - variable
  - header
---

Trick to prevent pandoc from adding title, date or author to the
document text: unset the `title` variable by setting it to an empty
string

    pandoc -V title='' …

The values will still be included in the document's metadata, but
won't become part of the text. The most common use-case for this
is HTML output, where the default header block may be unwanted.
