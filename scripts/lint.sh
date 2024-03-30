#!/bin/bash
echo "Linting source code..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Running swiftlint for linux with docker:"
  docker pull ghcr.io/realm/swiftlint:latest
  docker run -t -v `pwd`:/workdir -w /workdir ghcr.io/realm/swiftlint:latest swiftlint
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Running swiftlint for MacOS:"
  swift run swiftlint
elif [[ "$OSTYPE" == "msys"* ]]; then
  set +x
  echo "Swiftlint doesn't work on windows, will attempt to docker it"
  docker run -t -v /workdir:`pwd` -w /workdir ghcr.io/realm/swiftlint:latest swiftlint
fi
if [ $? -eq 0 ]; then 
  echo "Linting failed."
  exit 0;
fi

