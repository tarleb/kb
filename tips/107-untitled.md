---
tags:
- wiki
- wikilinks
- Markdown
- CommonMark
---

Pandoc 3 introduced Markdown support for wikilinks:

    [[pandoc|https:/‌/github.com]]

There is no consensus across tools on whether the link title should come
before or after the pipe character, so pandoc supports both. Choose by
enabling either of the new extensions

    +wikilinks_title_after_pipe

or

    +wikilinks_title_before_pipe

Works with CommonMark, too: for GitHub wiki input, use

    pandoc --from=gfm+wikilinks_title_after_pipe …
