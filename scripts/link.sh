#!/usr/bin/env bash

NEOVOSS_DIR=$(pwd)

createLink() {
  echo -e "Removing previous link"
  rm -f $HOME/.config/nvim

  ln -s $NEOVOSS_DIR $HOME/.config/nvim
}

createLink
