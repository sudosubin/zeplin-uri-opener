#!/bin/bash

zpl_open() {
  local uri;
  local web;
  local headless;

  # check headless mode
  if [ "$1" = "--headless" ]; then
    uri="$2";
    headless="true";
  else
    uri="$*";
    headless="false";
  fi

  # uri -> web
  web=$(perl -e """

  use URI;
  use URI::QueryParam;

  \$uri = URI->new('$uri');

  # scheme validation
  if (\$uri->scheme ne 'zpl') {
      exit 1;
  }

  # authority validation
  if ((\$uri->authority ne 'project') && (\$uri->authority ne 'screen')) {
      exit 1;
  }

  # query params
  \$pid = \$uri->query_param('pid');
  \$seid = \$uri->query_param('seid');
  \$tag = \$uri->query_param('tag');
  \$sid = \$uri->query_param('sid');

  # query params pid validation
  if (\$pid eq '') {
      exit 1;
  }

  \$web = URI->new('https://app.zeplin.io');

  # screen uri
  if (\$sid ne '') {
      \$web->path_segments('project', \$pid, 'screen', \$sid);
      print \$web;
      print \"\n\";
      exit 0;
  }

  # project uri
  \$web->path_segments('project', \$pid);

  if (\$seid ne '') {
      \$web->query_param(seid => \$seid);
  }

  if (\$tag ne '') {
      \$web->query_param(tag => \$tag);
  }

  print \$web;
  print \"\n\";

  """);

  if [ "$headless" = "true" ]; then
    echo "$web";
  else
    xdg-open "$web";
  fi
}

# execute function
zpl_open "$@"

# remove function
unset -f zpl_open
