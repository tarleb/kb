---
tags:
- linebreak
- Markdown
- CommonMark
---

Two ways to get a hard linebreak within a paragraph with Markdown:

1.  End the line with two spaces (most portable).

    ``` markdown
    I want a linebreak after this.␠␠
    This is a new line.
    ```

2.  "Backslash escape" the linebreak (more readable).

    ``` markdown
    I want a linebreak after this.\
    This is a new line.
    ```

Both methods work with pandoc and any CommonMark processor.
