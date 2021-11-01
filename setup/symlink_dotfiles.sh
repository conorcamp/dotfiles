#!/usr/bin/env bash
# Based on: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh

set -e

dotfile_dir="../dotfiles"
dotfile_backup="$HOME/.dotfile_backup/$(date +%s)"
#dotfile_paths=".config .bashrc .bash_profile .tmux.conf .tmuxline.config .vimrc .vim .hammerspoon"
dotfile_paths=".config .tmux.conf .tmuxline.config"

_dotfile_dir="$(realpath $dotfile_dir)"

# create dotfiles_old in homedir
echo -n "Creating $dotfile_backup for backup of any existing dotfiles in ~ ..."
mkdir -p "$dotfile_backup"
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dotfile_dir directory ..."
cd "$_dotfile_dir"
echo "done"

for path in $dotfile_paths; do
  if [[ -a "$HOME/$path" ]]; then
    echo "Backing up $path"
    cp -HR "${HOME:?}/$path" "$dotfile_backup/" && rm -r "${HOME:?}/$path" 
  fi
    echo "Creating symlink to $path in home directory."
    ln -s -F -f "$_dotfile_dir/$path" "$HOME/$path"
done
