#! /bin/bash

project_path=$(pwd)/Project
log_file=$(pwd)/build/unity-mac.log

error_code=0

echo "Building project."
/Applications/Unity/Unity.app/Contents/MacOS/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -buildOSXUniversalPlayer "$(pwd)/build/osx/ci-build.app" \
  -quit
if [ $? = 0 ] ; then
  echo "Build completed successfully."
  error_code=0
else
  echo "Building failed. Exited with $?."
  error_code=1
fi

echo 'Build logs:'
cat $log_file

echo "Finishing with code $error_code"
exit $error_code
