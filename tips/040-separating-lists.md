---
tags:
- Markdown
---

## Separating lists

Blank lines alone do not separate Markdown lists, but an empty HTML
comment does:

``` markdown
1. one
2. two

<!– –>

1. un
2. deux
```

Omitting the `<!-- -->` snippet in the example above results in a single
list with four items.
