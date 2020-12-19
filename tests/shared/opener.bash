#!/bin/bash

# shellcheck source=../../src/open-zpl.sh
opener() {
  sh "$BATS_TEST_DIRNAME/../src/open-zpl.sh" "$*";
}
