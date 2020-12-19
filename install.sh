#!/bin/bash

install_zpl_opener() {
  local root_dir;
  root_dir="$(dirname "${BASH_SOURCE[0]}")";

  # make script executable
  chmod +x "$root_dir/src/zpl-open.sh";

  # remove pre-installed files
  sudo rm "/usr/local/lib/zpl-open.sh";
  rm "$HOME/.local/share/applications/zpl-opener.desktop";

  # copy files to local
  sudo cp "$root_dir/src/zpl-open.sh" "/usr/local/lib/zpl-open.sh";
  cp "$root_dir/src/zpl-opener.desktop" \
    "$HOME/.local/share/applications/zpl-opener.desktop";

  # register opener
  xdg-mime default "$HOME/.local/share/applications/zpl-opener.desktop" \
    "x-scheme-handler/zpl"

  echo "installation complete!";
}

install_zpl_opener;

# remove function after installation
unset -f install_zpl_opener;
