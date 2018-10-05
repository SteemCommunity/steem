#!/usr/bin/env bash

echo "collecting coverage now..."

lcov --directory . --capture --output-file coverage.info # capture coverage info
lcov --remove coverage.info '/usr/*' --output-file coverage.info # filter out system
lcov --remove coverage.info 'test/*' --output-file coverage.info # filter out test
lcov --remove coverage.info 'libraries/fc/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/net/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/utilities/*' --output-file coverage.info
lcov --remove coverage.info 'libraries/vendor/*' --output-file coverage.info
lcov --remove coverage.info 'programs/*' --output-file coverage.info


echo "coverage collected to coverage.info"
ls -al coverage.info
