#!/bin/bash
runswift=$(swift run swiftlint)
echo $runswift
if [ "$runswift" == "" ]; then
  docker run -it -v `pwd`:`pwd` -w `pwd` ghcr.io/realm/swiftlint:latest
fi

