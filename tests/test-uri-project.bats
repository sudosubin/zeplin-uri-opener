#!/usr/bin/env bats

load shared/opener
load shared/random

@test "uri project" {
  pid="$(random "pid")";
  uri="zpl://project?pid=$pid";
  result="$(opener "$uri")";

  [ "$result" = "https://app.zeplin.io/project/$pid" ]
}

@test "uri project with tag" {
  pid="$(random "pid")";
  tag="$(random "tag")";
  uri="zpl://project?pid=$pid&tag=$tag";
  result="$(opener "$uri")";

  [ "$result" = "https://app.zeplin.io/project/$pid?tag=$tag" ]
}

@test "uri project with section" {
  pid="$(random "pid")";
  seid="$(random "seid")";
  uri="zpl://project?pid=$pid&seid=$seid";
  result="$(opener "$uri")";

  [ "$result" = "https://app.zeplin.io/project/$pid?seid=$seid" ]
}
