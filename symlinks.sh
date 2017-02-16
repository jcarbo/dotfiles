# http://stackoverflow.com/a/9107028
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_ARCHIVE_DIR=$(echo $DOTFILES_DIR | sed "s|dotfiles|old-dotfiles|")

SYMLINKS_DIR=$DOTFILES_DIR/symlinks

for name in $(ls -a $SYMLINKS_DIR); do
  # Skip . and ..
  if [[ $name =~ ^..?$ ]]; then
    continue
  fi

  target=~/$name

  # If there's already a file there, archive it.
  if [[ -e "$target" ]]; then
    # The -f flag to `ln` does not work as expected when the existing
    # link is a folder. Instead of replacing it, the new link is created
    # inside the existing link's folder. To prevent that, we just delete the
    # existing symlink.
    if [[ -L "$target" ]]; then
      rm $target

    # If the file is already there and it's not a symlink, archive it.
    else
      mkdir -p $DOTFILES_ARCHIVE_DIR
      mv $target $DOTFILES_ARCHIVE_DIR
    fi
  fi

  ln -sfv $SYMLINKS_DIR/$name $target
done
