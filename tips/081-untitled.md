---
tags:
- EPUB
- fonts
---

EPUB tip: sometimes pandoc doesn't bundle all resources required for the
desired rendering -- fonts being a typical example. Include those files
as images in placeholder metadata fields:

    ---
    extra-files:
    - '![](my-font.tff)'
    ---

This ensures that the files are picked up and packed into the generated
EPUB archive.
