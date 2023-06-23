#!/bin/sh

$IMAGE="doom64ce/n64sdkmod:1"

if [[ "$(docker images -q $IMAGE 2> /dev/null)" == "" ]]; then
  docker build --no-cache -t $IMAGE .

docker run -it --rm --name doom64ce -v .:/usr/src -w /usr/src/doom64 $IMAGE ./make-rom.sh
