#! /bin/bash

build_dir=$(pwd)/build
build_name=$build_dir/ci-build
project_path=$(pwd)/Project
log_file=$build_dir/unity.log

mkdir -p $build_dir

echo "Project Directory:"
ls $project_path/Assets

error_code=0

echo "Building project."
./Unity3D/Editor/Unity \
  -batchmode \
  -nographics \
  -silent-crashes \
  -force-free \
  -logFile $log_file \
  -projectPath $project_path \
  -buildLinuxUniversalPlayer $build_name \
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
