#!/bin/bash
SIZE=${1:-16}
LABELS="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z #"
COLORS="black blue darkblue darkred darkslateblue deepskyblue firebrick forestgreen goldenrod green red steelblue"

mkdir -p "${SIZE}x${SIZE}" 2>/dev/null

for COLOR in $COLORS; do
  for L in $LABELS; do
    gm convert \
      -size ${SIZE}x${SIZE} "xc:white" \
      -fill $COLOR \
      -stroke $COLOR \
      -draw "circle $(($SIZE/2)),$(($SIZE/2)),$(($SIZE/2)),0" \
      -fill white \
      -stroke none \
      -pointsize $(($SIZE-4)) \
      -gravity center \
      -font /usr/share/fonts/gnu-free/FreeMonoBold.ttf \
      -draw "text 1,1 '$L'" \
      /tmp/foreman-dummy.png
    pngcrush /tmp/foreman-dummy.png "${SIZE}x${SIZE}/$COLOR-${L,,}.png"
  done
done
