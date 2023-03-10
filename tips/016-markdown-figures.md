---
tags:
- figure
- Markdown
---

## Markdown figures

An image with a description is treated as a figure if it is the only
element in a Markdown paragraph:

    ![Male mandrill](mandrill.jpg)

This can be turned-off for individual images by appending a (possibly
empty) HTML comment

    ![Peppers](peppers.jpg)<!-- -->

or globally by disabling the `implicit_figures` extension:

    pandoc --from=markdown-implicit_figures
