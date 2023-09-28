---
title: Default input files
tags:
  - defaults
---

Defaults files can fix the set of input files, as well as their order.
Example: process the files foo​.md and bar​.md in this order by writing

	input-files:
  	- foo​.md
  	- bar​.md

to all.yaml. Then use it by calling pandoc with

	pandoc -d all

#pandoc #defaultFiles
