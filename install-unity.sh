#! /bin/bash

download() {
  echo "Downloading from $url: "
  curl -o $package "$url"
}

install() {
  url=$1
  package=`basename $url`
  install_dir="$(pwd)/Unity3D"
  component_list="component_list.txt"
  download

  echo "Installing $package to $install_dir"
  chmod +x $package
  echo y | ./$package \
    --unattended \
    --components='Unity' \
    --install-location=$install_dir
}

install "http://beta.unity3d.com/download/3c89f8d277f5/UnitySetup-2017.3.0f1"
