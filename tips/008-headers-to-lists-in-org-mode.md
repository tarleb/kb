---
tags:
- Emacs
- Org mode
---

## Headers to lists in Org mode

When converting Emacs Org mode documents, be aware that pandoc respects
many org export options and uses the same defaults. E.g., a common
source of confusion is that 4th level headers become paragraphs by
default. It happens in Emacs too, but can be prevented by adding
`#+OPTIONS: H:9`{.orgmode} to the top of the org document.
