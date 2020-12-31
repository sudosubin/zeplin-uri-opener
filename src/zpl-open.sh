#!/bin/bash

expand_query_param() {
  local uri="$1";
  local key="$2";
  local values=("${@:3}");
  local -r pattern_check="\?";

  for value in "${values[@]}"; do
    if [[ $uri =~ $pattern_check ]]; then
      uri="$uri&$key=$value";
    else
      uri="$uri?$key=$value";
    fi
  done

  echo "$uri";
}

zpl_open() {
  local uri;
  local web;
  local headless;

  # check headless mode
  if [ "$1" = "--headless" ]; then
    uri="$2";
    headless=true;
  else
    uri="$*";
    headless=false;
  fi

  # default regex pattern
  local -r pattern="^(([a-z]{3,5})://)([a-zA-Z0-9]+)(\?[^#]*)?$";
  if [[ ! "$uri" =~ $pattern ]]; then
    return 1;
  fi

  # parse uri schema
  local -r schema="${BASH_REMATCH[2]}";
  if [[ "$schema" != "zpl" ]]; then
    return 1;
  fi

  # parse uri authority(path)
  # shellcheck disable=SC2034
  local -r authority="${BASH_REMATCH[3]}";

  # parse uri query
  local query="${BASH_REMATCH[4]}";
  local -r pattern_query="^[?&]+([^= ]+)(=([^&]*))?";

  while [[ $query =~ $pattern_query ]]; do
    eval "args_${BASH_REMATCH[1]}+=(${BASH_REMATCH[3]})";
    query="${query:${#BASH_REMATCH[0]}}";
  done

  # validate oid or pid
  # shellcheck disable=SC2154
  if [[ ${#args_oid[@]} -ne 1 ]] && [[ ${#args_pid[@]} -ne 1 ]]; then
    return 1;
  fi

  # set web
  web="https://app.zeplin.io";

  # validate oid
  if [[ ${#args_oid} -ne 0 ]]; then
    web="$web/organization/${args_oid[0]}/projects";
  fi

  # validate pid
  if [[ ${#args_pid} -ne 0 ]]; then
    web="$web/project/${args_pid[0]}";
  fi

  # validate sid
  # shellcheck disable=SC2154
  if [[ ${#args_sid} -ne 0 ]]; then
    web="$web/screen/${args_sid[0]}";
  fi

  # validate tag
  # shellcheck disable=SC2154
  if [[ ${#args_tag} -ne 0 ]]; then
    web="$(expand_query_param "$web" "tag" "${args_tag[@]}")";
  fi

  # validate seid
  # shellcheck disable=SC2154
  if [[ ${#args_seid} -ne 0 ]]; then
    web="$(expand_query_param "$web" "seid" "${args_seid[@]}")";
  fi

  if [ "$headless" = true ]; then
    echo "$web";
  else
    xdg-open "$web";
  fi
}

# execute function
zpl_open "$@";

# remove function
unset -f expand_query_param;
unset -f zpl_open;
