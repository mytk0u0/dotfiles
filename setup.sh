#!/bin/bash

set -euxo pipefail

REPOS_DIR=$(cd $(dirname $0); pwd)
DOT_FILES=(
  .xonshrc
  .gitconfig
  .config/nvim/init.vim
  .config/nvim/dein/toml/dein.toml
  .config/nvim/dein/toml/dein_lazy.toml
)

for file in ${DOT_FILES[@]}
do
   mkdir -p $(dirname $HOME/$file)
   ln -sf $REPOS_DIR/dotfiles/$file $HOME/$file
done
