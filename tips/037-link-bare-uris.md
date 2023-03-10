---
tags:
- Markdown
- format extension
---

## Link bare URIs

The `autolink_bare_uris` extension for Markdown allows to omit the angle
brackets that are otherwise required to mark URLs as links. E.g., the
input The manual's URL is https:​//​pandoc.org/MANUAL.html. becomes
identical to The manual's URL is <https:​//​pandoc​.org/MANUAL.html>. as
can be seen by running the former through

    pandoc --from markdown+autolink_bare_uris --to markdown

(The example URL contains an extra char for technical reasons; do not
copy-paste it.) pandoc format extension
