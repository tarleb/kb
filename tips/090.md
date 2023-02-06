---
tags:
- Markdown
- code block
---

Two Markdown tricks to "nest" code blocks, i.e., to use backtick-based
code block syntax within a code block:

1.  More backticks for the outer block:

    ```````` markdown
    ````` markdown
    ``` r
    print('Hello!')
    ```
    `````
    ````````

2.  Tildes:

    ```````` markdown
    ~~~ markdown
    ``` r
    print('Bonjour!')
    ```
    ~~~
    ````````

There's also a third method:

3.  Indent by four spaces

    ````` markdown
        ``` r
        print('Moin')
        ```
    `````

Note though that this last option differs from the other two in that it
doesn't enable syntax highlighting.
