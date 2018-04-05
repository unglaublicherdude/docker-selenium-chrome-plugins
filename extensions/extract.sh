#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTENSION_FILE_DIR="$DIR/original-extension-files"
EXTENSION_DIRECTORIES_DIR="$DIR/extracted-extensions"

if [ ! -d "$EXTENSION_DIRECTORIES_DIR" ]; then
	mkdir $EXTENSION_DIRECTORIES_DIR
fi

find $EXTENSION_FILE_DIR -type f -exec basename {} \; |
while read EXTENSION_FILE;
do
	EXTENSION_DIR="$EXTENSION_DIRECTORIES_DIR/$(echo $EXTENSION_FILE | sed 's/\.crx//g' )"
	if [ -d "$EXTENSION_DIR" ]; then
		rm -rf  $EXTENSION_DIR
    fi
	mkdir $EXTENSION_DIR
	cd $EXTENSION_DIR
	tail -c +307 $EXTENSION_FILE_DIR/$EXTENSION_FILE > /tmp/file.crx;
	unzip -oxq /tmp/file.crx || echo "just a warning, extract did work anyway";
done
