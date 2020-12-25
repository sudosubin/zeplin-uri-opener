#!/usr/bin/env bats

load shared/opener
load shared/random

@test "wrong schema" {
  pid="$(random "pid")";
  uri="wrg://project?pid=$pid";
  result="$(opener "$uri")";

  [ "$result" = "" ]
}
