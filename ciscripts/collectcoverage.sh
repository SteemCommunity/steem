#!/usr/bin/env bash

./build/tests/chain_test
./build/tests/plugin_test

lcov --directory . --capture --output-file coverage.info # capture coverage info
lcov --remove coverage.info '/usr/*' --output-file coverage.info # filter out system

wget -O - https://codecov.io/bash | bash || echo "Codecov did not collect coverage reports"