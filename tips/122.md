---
tags:
- exit code
---

Exit codes are useful, e.g. when embedding pandoc in wrapper-scripts.
Pandoc exiting with code zero signals success, with other numbers
indicating the type of error that occurred. For example, exit code 84
hints at a problem in the Lua subsystem. The full list is in the manual:
https://pandoc.org/MANUAL.html#exit-codes
