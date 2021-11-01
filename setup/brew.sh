#!/usr/bin/env bash


# https://stackoverflow.com/a/43027113
install_homebrew_if_not_present() {
    echo "Checking for homebrew installation"
    if brew; then
        echo "Homebrew not found. Installing..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "Homebrew already installed! Updating..."
        brew update
    fi
}

# https://stackoverflow.com/a/44348249
function _brew_install {
  local target
  target="$1"
  if [[ $1 -eq 0 ]]; then
    echo "No target passed"
    exit 0
  fi
  shift
  if brew ls --versions "$target" > /dev/null; then
      HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade "$target"
  else
      HOMEBREW_NO_AUTO_UPDATE=1 brew install "$target"
  fi
}

function brew_install() {
  local check_cmd install_cmd upgrade_cmd target 

  case "$1" in
    "brew")
      check_cmd="brew ls --versions"
      install_cmd="brew install"
      upgrade_cmd="brew upgrade"
      ;;
    "cask")
      check_cmd="brew cask list"
      install_cmd="brew cask install"
      upgrade_cmd="brew cask upgrade"
      ;;
    *)
      echo "First argument must be 'brew' or 'cask'."
      exit 1
      ;;
  esac

  if [[ $2 -eq 0 ]]; then
    echo "No target passed"
    exit 1
  else
    target="$2"
  fi

  eval "$install_cmd $target"
}



# Install homebrew
install_homebrew_if_not_present

# Terminal Installations
## Basic
brew install \
  bash \
  bash-completion@2 \
  ccat \
  coreutils \
  findutils \
  fzf \
  git \
  gnupg \
  grep \
  jq \
  pyenv \
  reattach-to-user-namespace \
  rg \
  tmux \
  vim \
  wget

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

### universal-ctags needs to be installed from HEAD
#brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# GUI Installations
#brew install --cask \
#  alacritty \
#  alfred \
#  caffeine \
#  flux \
#  hammerspoon \
#  karabiner-elements \
#  slack \
#  google-chrome

## Fonts
brew tap homebrew/cask-fonts
brew install font-inconsolata

### Powerline Fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
