---
tags:
- CLI
- yaml
---

"Defaults files" are a convenient tool to store, group, and combine
related command line options. E.g., instead of typing

    pandoc --pdf-engine=xelatex -V csquotes

one could create a file `pdf.yaml` with

    pdf-engine: xelatex
    variables: {csquotes: true}

and use it with

    pandoc -d pdf.yaml

https://pandoc.org/MANUAL#defaults-files
