---
tags:
- comment
- Markdown
---

Three methods to add a comment to pandoc Markdown texts:

1.  <!-- -->

    ``` markdown
    <!-- HTML comment; will show up in HTML output,
         unless suppressed with `--strip-comments` -->
    ```

2.  <!-- -->

    ``` markdown
    ---
    # YAML block with comment.
    # Always removed.
    ---
   ```

3.  <!-- -->

    ~~~ markdown
    ``` {=comment}
    Creative use of raw blocks.
    Included in md output, dropped everywhere else.
    ```
    ~~~
