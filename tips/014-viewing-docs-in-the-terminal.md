---
tags:
- terminal
- Linux
- Mac
---

## Viewing docs in the terminal

Files of supported formats can be read like Unix man pages in the
terminal:

    pandoc -s -t man INPUT_FILE | man -l -

Define a shell function for extra convenience:

    mandoc () { pandoc -s -t man "$@" | man -l - }

Violà, a short and friendly command to read documents:

    mandoc letter.docx

Works on Linux and Mac. pandoc
