#!/bin/bash

# Generate .md file from .tex
pandoc --standalone --from=latex main.tex --output=index.md --to=gfm

# Add some preamble at the beginning of the file
echo '---
usemathjax:true
---
<script type="text/javascript">
window.MathJax = {
  tex: {
    packages: ['base', 'ams']
  },
  loader: {
    load: ['ui/menu', '[tex]/ams']
  }
};
</script>

[comment]: <> (This .md file is automatically generated from main.tex)

' | cat - index.md > temp && mv temp index.md

# Escape {{ to { { since {{ means something in markdown
sed -i 's/{{/{ {/g' index.md
sed -i 's/}}/} }/g' index.md
