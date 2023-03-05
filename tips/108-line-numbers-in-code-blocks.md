---
tags:
- code
- line numbers
- Markdown
- Org mode
- LaTeX
- ConTeXt
- HTML
---

# Line numbers in code blocks

Pandoc supports number code lines in a many output formats, incl. TeXLaTeX,
ConTeXt, and HTML (but not docx)

Markdown:

```` markdown
``` lua {.number-lines}
print 'Hello!'
return true
```
````

Org mode:

``` org
#+begin_src lua +n
print 'Please answer!'
return 42
#+end_src
```

Rendered HTML:

![Two lines of Lua code, each preceded by a line number. The code has been
syntax highlighted.](108-line-numbers.png) <!-- not a figure -->
