#!/bin/bash

# $1 - string length to generate
_random() {
  tr -dc "a-z0-9" < /dev/urandom | head -c "$1";
  echo '';
}

# $1 - type of random string to generate (oid, pid, seid, sid, tag)
random() {
  _random 24;
}
