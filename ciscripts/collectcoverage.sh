#!/usr/bin/env bash

./build/tests/chain_test
./build/tests/plugin_test

lcov --directory . --capture --output-file coverage.info # capture coverage info
lcov --remove coverage.info '/usr/*' --output-file coverage.info # filter out system
lcov --remove coverage.info 'test/*' --output-file coverage.info # filter out test
lcov --remove coverage.info 'libraries/fc/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/net/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/utilities/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/vendor/*' --output-file coverage.info
lcov --remove coverage.info 'programs/*' --output-file coverage.info
