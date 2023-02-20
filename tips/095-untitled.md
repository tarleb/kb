---
tags:
- HTML
- semantic
---

Pandoc produces "flat" HTML output by default, placing all header
elements on the same level in the document tree. The `--section-divs`
option enables a hierarchical element structure, wrapping headings and
the respective contents in

```{=html}
<section>
```
elements:

    <section class="level1">
      <h1>Intro</h1>
      <p>Text</p>
      <section class="level2">
        <h2>Subsection</h2>
        <p>More</p>
      </section>
    </section>

This adds semantic info and can help with styling.
