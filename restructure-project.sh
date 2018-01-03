#! /bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SRC_ASSETS_DIR=src
SRC_TESTS_DIR=test
SRC_PROJECT_SETTINGS_DIR="$SCRIPT_DIR/ProjectSettings"

DST_ASSETS_DIR=./Project/Assets/src
DST_TEST_DIR=./Project/Assets/test
DST_PROJECT_SETTINGS_DIR=./Project/ProjectSettings
TARGET_PROJECT_SETTINGS_DIR

copy() {
  if [ -d $1 ]; then
    mkdir -p $2
    cp -r $1 $2
    echo "Copied $1 to $2"
  else
    echo "Directory $1 does not exist. Skipping..."
  fi
}

copy $SRC_ASSETS_DIR $DST_ASSETS_DIR
copy $SRC_TEST_DIR $DST_TEST_DIR
copy $SRC_PROJECT_SETTINGS_DIR $DST_PROJECT_SETTINGS_DIR

echo 'Finished restructuring project.'
