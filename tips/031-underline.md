---
tags:
- underline
- Org mode
- Doku wiki
- Textile
- Jira
- Markdown
---

## Underline

Underline text in different lightweight markup languages:

- Emacs Org mode: `*this*`

- Doku wiki: `**this**`

- Textile, Jira: `+this+`

There is no Markdown syntax for underlined text, but pandoc's Markdown
reader treats the content of spans with class "underline" or "ul" as
underlined:

    [important]{.underline}
    [nota bene]{.ul}
