#!/bin/sh

echo "Setting up file copy..."
SOURCE="${SOURCE}"
DESTINATION="${DESTINATION}"

echo "Starting copy from $SOURCE to $DESTINATION..."
rsync -av "$SOURCE" "$DESTINATION"
echo "Done!"

sleep 60