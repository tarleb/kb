---
tags:
- CLI
- warning
---

Pandoc warns when it cannot convert parts of the input. Use

    pandoc --fail-if-warnings

to make sure that all of the input is converted as expected: no output
will be produced in case of a warning.
