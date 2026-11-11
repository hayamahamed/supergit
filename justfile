default:
  #!/usr/bin/env bash
  
  rm -rf dist
  mkdir dist
  for i in rpm deb archlinux; do
    nfpm package -p $i --target dist || exit 1
  done
  
  for i in rpm deb pkg.tar.zst; do
    mv dist/*.$i dist/supergit.$i
  done
  
  echo "Done"
