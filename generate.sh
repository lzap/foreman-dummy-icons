#!/bin/bash
COLOR=${1:-black}
SIZE=${2:-21}
LABELS="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"

mkdir -p "${SIZE}x${SIZE}-$COLOR" 2>/dev/null

for L in $LABELS; do
  gm convert \
    -size ${SIZE}x${SIZE} "xc:$COLOR" \
    -fill white \
    -pointsize 21 \
    -gravity center \
    -draw "text 0,2 '$L'" \
    -fill none \
    -stroke white \
    -draw "rectangle 0,0,$(($SIZE-1)),$(($SIZE-1))" \
    "${SIZE}x${SIZE}-$COLOR/${L,,}.png"
done
