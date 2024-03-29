#!/bin/bash
runswift=$(swift package plugin swiftlint)

if [ $runswift -eq 0 ]; then
  docker run -it -v `pwd`:`pwd` -w `pwd` ghcr.io/realm/swiftlint:latest
fi

