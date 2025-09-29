export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  dnf
)

source $ZSH/oh-my-zsh.sh
source $HOME/.config/lscolors.sh

alias nv="nvim"

export VCPKG_ROOT=$HOME/Dev/tools/vcpkg
export PATH=$VCPKG_ROOT:$PATH
