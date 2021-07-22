#!/bin/bash

# Generate .md file from .tex
pandoc -s main.tex -o index.md --mathjax

# Add some preamble at the beginning of the file
echo "[comment]: <> (This .md file is automatically generated from main.tex)
---
usemathjax: true
---
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
" | cat - index.md > temp && mv temp index.md

