---
tags:
- template
- CLI
---

Need a template engine?\
🦀\
Why not pandoc?

Template (a.txt):

    Hello from ${place}!

Command:

    pandoc --template=a.txt -V place='Decapod 10' /dev/null

Output:

    Hello from Decapod 10!


The template engine is flexible and powerful; it was designed
specifically for pandoc. Features include

- interpolation,
- partials (for modularization),
- conditionals,
- loops,
- text layouting utils, and
- simple text modifications.

https://pandoc.org/MANUAL#template-syntax
