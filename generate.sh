#!/bin/bash
COLOR=${1:-black}
SIZE=${2:-21}
LABELS="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"

mkdir -p "${SIZE}x${SIZE}-$COLOR" 2>/dev/null

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
    -draw "text 1,1 '$L'" \
    "${SIZE}x${SIZE}-$COLOR/${L,,}.png"
done
