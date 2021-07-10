#!/bin/bash

opener() {
  # do not open browser, just return web url string
  bash "$BATS_TEST_DIRNAME/../src/zpl-open" "--headless" "$*";
}
