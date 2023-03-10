---
tags:
- HTML
- CSS
- quotation
---

## HTML `<q>` tags

Pandoc's `--html-q-tags` parameter triggers the use of `<q>`{=html}
elements instead of quotation marks in HTML/#EPUB output.

    pandoc <<< '"Hello", they said.'
    ⇒ <p>“Hello”, they said.</p>

    pandoc --html-q-tags <<< '"Hello", they said.'
    ⇒ <p><q>Hello</q>, they said.</p>

This makes it easy to apply extra styling to quotes via CSS. See also:
https://developer.mozilla.org/en-US/docs/Web/CSS/quotes
