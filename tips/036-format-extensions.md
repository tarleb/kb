---
tags:
- Markdown
- format extension
---

## Format extensions

The handling of formats can be tweaked by enabling or disabling format
extensions. Running

    pandoc --list-extensions=my_format

lists available extensions and their default status. Extensions are
enabled by prefixing them with `+`, and disable with `-`:

    pandoc --from my_format+enabled_extension-disabled_extension

Example: disable the smart handling of quotes, ellipses, etc in Markdown
with

    pandoc --from=markdown-smart
