---
tags:
- Docker
- Download
- release
---

## Docker images

We maintain a number of Docker images for quick 'n easy access to
pandoc, e.g. in CI systems. Types of pandoc/\* Docker images:

- minimal -- very small, just the bare pandoc binary;

- core -- includes pandoc-crossref and helpers needed for SVG image
  conversion;

- latex -- like core, plus TeXLive with all packages required by the
  default template.

https://hub.docker.com/u/pandoc


The code used to generate the Docker images is available from
<https://github.com/pandoc/dockerfiles>. The accompanying README
contains more info as well as usage instructions.
