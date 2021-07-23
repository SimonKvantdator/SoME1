#!/bin/bash

# Generate .md file from .tex
# pandoc --standalone --from=latex main.tex --output=index.md --to=gfm
pandoc -s main.tex --o index.md

# Add some preamble at the beginning of the file
echo '---
usemathjax:true
---
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>

[comment]: <> (This .md file is automatically generated from main.tex)

' | cat - index.md > temp && mv temp index.md

# Escape {{ to { { since {{ means something in markdown
# sed -i 's/{{/{ {/g' index.md
# sed -i 's/}}/} }/g' index.md
