---
tags:
- reveal.js
- slides
---

Reveal.js tip: Adding the *r-stretch* class to an image produces an
image that's stretched to fill the slide. The image should be the only
element on that slide. E.g.

    pandoc -t revealjs -s slides.md

with slide content

    ![Results](graph.png){.r-stretch}
