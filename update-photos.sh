#!/bin/sh
# Rebuilds photos.js from the images in the photos/ folder.
# Run this after adding or removing photos: ./update-photos.sh
cd "$(dirname "$0")"
{
  echo "var PHOTOS = ["
  ls photos | grep -iE '\.(jpe?g|png|gif|webp)$' | sed 's/.*/  "&",/'
  echo "];"
} > photos.js
echo "photos.js updated: $(ls photos | grep -ciE '\.(jpe?g|png|gif|webp)$') photos"
