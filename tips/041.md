---
tags:
- TeX
- LaTeX
- l10n
- quoted
---

The "csquotes" LaTeX package provides advanced facilities for inline
and display quotations. The package has excellent support for different
languages, too. Set the `csquotes` variable to make pandoc use this
package when rendering quotes. For best results, set the `lang` variable
as well. E.g., the first output below was created with `pandoc -o a.pdf`
and the second with `pandoc -o a.pdf -V csquotes`.

![Default English quotation marks](media/csquotes-disabled.png)
![Proper use of Guillemets](media/csquotes-enabled.png)
