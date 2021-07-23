#!/bin/bash

# Generate .md file from .tex
# pandoc --standalone --from=latex main.tex --output=index.md --to=gfm
pandoc -s main.tex --o index.md --mathjax

# Add some preamble at the beginning of the file
echo '---
usemathjax:true
---
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

[comment]: <> (This .md file is automatically generated from main.tex)

' | cat - index.md > temp && mv temp index.md

# Escape {{ to { { since {{ means something in markdown
# sed -i 's/{{/{ {/g' index.md
# sed -i 's/}}/} }/g' index.md
