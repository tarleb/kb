---
tags:
- Beamer
- slides
---

"Block" divs around a heading and with class "example" or "alert" get
turned into boxes on Beamer slides. The classes example & alert allow
for alternative coloring. Shown here for `--slide-level=2` and with
theme "Frankfurt". pandoc

    ::: {.block}
    ### A block
    Try to block it out!
    :::

    ::: {.block .example}
    ### Example
    Demo
    :::

    ::: {.block .alert}
    ### Heads up!
    Watch out.
    :::

![Beamer block types](media/beamer-blocks.png)
