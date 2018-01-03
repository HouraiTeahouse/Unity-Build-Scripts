#! /bin/bash

download() {
  url="$BASE_URL/$HASH/$package"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url"
}

install() {
  package=$1
  install_dir="$(pwd)/Unity3D"
  download "$package"

  echo "Installing "`basename "$package"`" to $install_dir"
  chmod +x $package
  ./$package --unattended --instal-location="$install_dir"

  ls $install_dir
}

install "http://beta.unity3d.com/download/3c89f8d277f5/UnitySetup-2017.3.0f1"
