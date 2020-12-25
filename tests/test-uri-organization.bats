#!/usr/bin/env bats

load shared/opener
load shared/random

@test "uri organization with section" {
  oid="$(random "oid")";
  seid="$(random "seid")";
  uri="zpl://projects?oid=$oid&seid=$seid";
  result="$(opener "$uri")";

  [ "$result" = "https://app.zeplin.io/organization/$oid/projects?seid=$seid" ]
}
