---
tags:
- image
- conversion
- DPI
---

## Vector graphic rasterization

Dissatisfied with the resolution of images in the pandoc-generated
output? Some formats require the conversion of vector graphics to raster
images, a process that can be controlled with the `--dpi` option. The
default for it is 96; set the parameter to a higher value to get images
with higher resolutions.

``` bash
pandoc --dpi=300 ...
```
