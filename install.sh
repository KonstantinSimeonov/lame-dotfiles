read -r -p "replace existing dotfiles (.bashrc, .psqlrc, .gitconfig) with symlinks? [y/N] " answer

case $answer in
  [yY])
    echo "proceeding...";;
  *)
    echo "aborted, doing nothing"
    exit;;
esac

rm ~/{.bashrc,.psqlrc,.gitconfig}

readonly DIR=$(readlink -e "$(dirname "$0")")

ln -s "$DIR/.bashrc" ~/.bashrc
ln -s "$DIR/.psqlrc" ~/.psqlrc
ln -s "$DIR/.gitconfig" ~/.gitconfig

echo done
