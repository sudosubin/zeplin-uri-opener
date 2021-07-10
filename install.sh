#!/bin/bash

install_zpl_opener() {
  local root_dir;
  root_dir="$(dirname "${BASH_SOURCE[0]}")";

  # copy files
  mkdir -p "$HOME/bin"
  mkdir -p "$HOME/.local/share/applications";

  cp "$root_dir/src/zpl-open" "$HOME/bin/zpl-open";
  cp "$root_dir/src/zpl-opener.desktop" \
    "$HOME/.local/share/applications/zpl-opener.desktop";

  # register opener
  xdg-mime default "zpl-opener.desktop" "x-scheme-handler/zpl";

  echo "installation complete!";
}

install_zpl_opener;

# remove function after installation
unset -f install_zpl_opener;
