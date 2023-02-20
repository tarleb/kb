---
tags:
- layout
- LaTeX
- PDF
---

## Page margins

Control page margins in PDFs via the `geometry` variable, e.g. in YAML

    ---
    geometry: margin=2cm
    ---

or on the command line

    pandoc -V geometry=left=3cm,right=4cm
