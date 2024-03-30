#!/bin/bash
echo "Linting source code..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Running swiftlint for linux with docker:"
  docker pull ghcr.io/realm/swiftlint:latest
  docker run -t -v `pwd`:`pwd` -w `pwd` ghcr.io/realm/swiftlint:latest swiftlint
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Running swiftlint for MacOS:"
  swift run swiftlint
elif [[ "$OSTYPE" == "msys"* ]]; then
  set +x
  echo "Swiftlint doesn't work on windows, there is a workaround but you will need to edit this part of scripts/lint.sh"
  echo "This will crash due to path escaping issues, please replace pwd with project directory, fully escaped, then uncomment the next line."
  ## docker run -t -v `pwd`:/workdir -w /workdir ghcr.io/realm/swiftlint:latest swiftlint
fi
if [ $? -eq 1 ]; then 
  echo "Linting failed."
  exit 1;
fi

