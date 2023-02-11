---
tags:
- Markdown
- wrapping
- backslash
---

There are times when words or characters have spaces between them, but the
spaces need to be non-breaking-- that is, we need them to remain together
instead of ending up on separate lines. For example, J. R. R. Tolkien could get
broken into 
```
J. R.
R. Tolkien
```
or 128 cm could end up as 
```
128
cm
```

The solution to this issue is to use a "backslash-escape" before a space to mark
it as non-breaking. J. R. R. Tolkien turns into J.\ R.\ R.\ Tolkien, and 128 cm
turns becomes 128\ cm. This ensures that the relevant words stay on the same
line. 
