#!/bin/bash

mkdir -p images-grayscale

rm -rf images-grayscale/* &>/dev/null

cp -r images/* images-grayscale &>/dev/null

find images-grayscale/* ! -name '*.png' -type f | xargs rm -f

FIND="images-grayscale/"

FILES=$(find $FIND -name "*.png")

#echo "Converting images to black and white..."
#echo ""

for file in $FILES; do

#   echo "convert $file -set colorspace Gray $file"
   filename=$(echo $file | sed "s#$FIND#/images/#g")
   filename=$(echo $filename | sed "s#//#/#g")
   docker run -ti --rm -v `pwd`/images-grayscale:/images sergiomtzlosa/imagemagick magick ${filename} -set colorspace Gray ${filename} &>/dev/null

done

exit 0;
