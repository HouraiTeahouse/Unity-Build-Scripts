#! /bin/bash

project_path=$(pwd)/Project
log_file=$(pwd)/build/unity.log

echo "Project Directory:"
ls $project_path

error_code=0

echo "Building project."
./Unity3D/Editor/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -logFile "$log_file" \
  -projectPath "$project_path" \
  -buildLinuxUniversalPlayer "$(pwd)/build/ci-build" \
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
