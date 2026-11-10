#!/bin/sh
# Pack the aigifmaker-go v0.1.1 CLI (release assets) into one snap per architecture.
set -e
V=0.1.1
for a in amd64 arm64; do
  mkdir -p build/$a/meta build/$a/bin && sed "s/ARCH/$a/" snap.yaml > build/$a/meta/snap.yaml
  curl -sSfL -o build/$a/bin/aigifmaker https://github.com/hanshs474/aigifmaker-go/releases/download/v$V/aigifmaker-linux-$a
  chmod 755 build/$a/bin/aigifmaker
done
docker run --rm -v "$PWD/build:/b" node:22-alpine sh -c 'apk add -q squashfs-tools &&
  for a in amd64 arm64; do mksquashfs /b/$a /b/aigifmaker_'$V'_$a.snap -noappend -comp xz -all-root -no-xattrs -no-fragments -quiet; done'
ls -la build/*.snap
