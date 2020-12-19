#!/usr/bin/env bats

load shared/opener
load shared/random

@test "uri screen" {
  pid="$(random "pid")";
  sid="$(random "sid")";
  uri="zpl://project?pid=$pid&sid=$sid";
  result="$(opener "$uri")";

  [ "$result" = "https://app.zeplin.io/project/$pid/screen/$sid" ]
}
