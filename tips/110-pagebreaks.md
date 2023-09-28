---
tags:
- pagebreak
- HTML
- EPUB
- Asciidoc
- docx
- groff
- ConTeXt
---

# Page breaks

The pagebreak Lua filter adds support for manual page-break markers in
the text with the raw #TeXLaTeX `\newpage` command. "Translated" by the
filter, this marker works with HTML & EPUB, Asciidoc, Word docx, groff
ms, and ConTeXt output.

The filter is available from <https://github.com/pandoc-ext/pagebreak>.

Quarto and RMarkdown ship with an older version of the pagebreak filter,
so no need to install it when pandoc is called through either of those.
#QuartoPub also supports the `{{ pagebreak }}` shortcode syntax.

https://quarto.org/docs/authoring/markdown-basics.html#page-breaks
