#!/bin/bash

opener() {
  # do not open browser, just return web url string
  sh "$BATS_TEST_DIRNAME/../src/zpl-open.sh" "--headless" "$*";
}
