#!/usr/bin/env bash

./build/tests/chain_test
./build/tests/plugin_test
mkdir -p /var/cobertura
gcovr --object-directory="../" --root=../ --xml-pretty --gcov-exclude=".*tests.*" --gcov-exclude=".*fc.*" \
      --gcov-exclude=".*app*" --gcov-exclude=".*net*" --gcov-exclude=".*plugins*" --gcov-exclude=".*schema*" \
      --gcov-exclude=".*time*" --gcov-exclude=".*utilities*" --gcov-exclude=".*wallet*" \
      --gcov-exclude=".*programs*" --gcov-exclude=".*vendor*" --output="/var/cobertura/coverage.xml"

- lcov --directory . --capture --output-file coverage.info # capture coverage info
- lcov --remove coverage.info '/usr/*' --output-file coverage.info # filter out system
- lcov --list coverage.info #debug info
# Uploading report to CodeCov
- bash <(curl -s https://codecov.io/bash) || echo "Codecov did not collect coverage reports"