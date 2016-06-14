#! /usr/bin/env bash

# Dev basics
sudo apt-get update
sudo apt-get install -y git tree tmux

# Emacs from source
sudo apt-get update
sudo debconf-set-selections <<< "postfix postfix/mailname string dankee.com"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo apt-get build-dep -y emacs24
pushd /tmp
  curl -O http://mirror.keystealth.org/gnu/emacs/emacs-24.5.tar.gz
  tar -xzvf emacs-24.5.tar.gz
  pushd emacs-24.5/
    ./configure
    make
    sudo make install
  popd
popd
rm -rf /tmp/emacs-24.5 /tmp/emacs-24.5.tar.gz

# Dev preferences
git clone https://github.com/ideal-knee/dotfiles.git ~/dotfiles
ln -s ~/dotfiles/emacs.d ~/.emacs.d
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
emacs --load ~/.emacs.d/init.el --batch

# Common Lisp
sudo apt-get install -y sbcl

# Clojure
sudo apt-get install -y openjdk-7-jre
sudo curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod a+x /usr/local/bin/lein
lein --version
