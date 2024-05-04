---
title: Internationalized Docker images
tags:
  - Docker
  - PDF
  - i18n
---

The default #pandoc #Docker images ship with support for common languages that use scripts based on the Latin alphabet. Documents in other writing systems generally requires custom images.
Example image that can be used with Ukrainian documents, adding a font with #Cyrillic glyphs:

	FROM pandoc/latex
	RUN tlmgr install babel-ukrainian
	RUN apk --no-cache add font-linux-libertine && fc-cache -f

Build with

	docker build -t pandoc-ukr -f Dockerfile .

#i18n #font #TeXLaTeX


An image created with the above method can then use with

	docker run … pandoc-ukr --pdf-engine=lualatex …

Example document:

	---
	title: "Приклад українською"
	mainfont: Linux Libertine
	lang: uk
	---

	Цей текст не дуже цікавий.

#pandoc #i18n
