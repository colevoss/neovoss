#!/usr/bin/env bash

declare -r NEOVOSS_DIR=$(pwd)
declare -r DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

NEOVOSS_URL="https://github.com/colevoss/neovoss.git"


backupOldConfig() {
  if [ -L "$CONFIG_HOME/nvim" ]; then
    echo "Link already exists. Removing link"
    rm "$CONFIG_HOME/nvim"
  fi

  if [ -d "$CONFIG_HOME/nvim" ]; then
    echo "Moving old neovim configuration"
    mv -ivh $CONFIG_HOME/nvim $CONFIG_HOME/nvim.bak
  fi

  if [ -d "$DATA_HOME/nvim" ]; then
    echo "Backing up old data files"
    mv -ivh $DATA_HOME/nvim $DATA_HOME/nvim.bak
  fi

  echo -e ""
}

cloneNeovoss() {
  echo "How do you want to install Neovoss?"
  echo " "
  echo "Do you want to:"
  echo "1 ) Clone directly into ~/.config/nvim"
  echo "2 ) Clone to your current directy and link to ~/.config/nvim"
  echo "3 ) Neither. Just give up."
  echo "Please input 1, 2, or 3"
  read -p "" -n 1 -r
  echo " "

  case $REPLY in
    1)
      backupOldConfig
      echo "Cloning into $CONFIG_HOME/nvim"
      git clone --depth 1 $NEOVOSS_URL $CONFIG_HOME/nvim

      echo "Installed!"
      echo "Open neovim with the following command"
      echo "nvim"
      ;;
    2)
      backupOldConfig
      echo "Cloning Neovoss"
      git clone --depth 1 $NEOVOSS_URL

      echo "Linking Neovoss to nvim config"
      ln -s -f -v $NEOVOSS_DIR/neovoss $CONFIG_HOME/nvim

      echo "Installed!"
      echo "Open neovim with the following command"
      echo "nvim"
      ;;
    # 3)
    #   echo "CHOSE 3"
    #   ;;
    * )
      return 1
      ;;
  esac
}

banner() {
  echo """
   _______             ____   ____                  
 \      \   ____  ___\   \ /   /___  ______ ______
 /   |   \_/ __ \/  _ \   Y   /  _ \/  ___//  ___/
/    |    \  ___(  <_> )     (  <_> )___ \ \___ \ 
\____|__  /\___  >____/ \___/ \____/____  >____  >
        \/     \/                       \/     \/
  """
}

main() {
  banner
  cloneNeovoss
}

main "$@"
