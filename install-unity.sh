#! /bin/bash

download() {
  echo "Downloading from $url: "
  curl -o $package "$url"
}

install() {
  url=$1
  package=`basename $url`
  install_dir="$(pwd)/Unity3D"
  download

  echo "Installing $package to $install_dir"
  chmod +x $package
  ./$package --unattended --install-location="$install_dir" --list-components

  ls $install_dir
}

install "http://beta.unity3d.com/download/3c89f8d277f5/UnitySetup-2017.3.0f1"
