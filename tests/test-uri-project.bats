#!/usr/bin/env bats

load shared/opener
load shared/random

@test "uri project" {
  pid="$(random "pid")"
  uri="zpl://project?pid=$pid"
  result="$(opener "$uri")"

  [ "$result" = "https://app.zeplin.io/project/$pid" ]
}
