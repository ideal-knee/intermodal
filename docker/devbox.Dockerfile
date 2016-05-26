FROM ubuntu:16.04

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "emacs", "git", "tmux", "tree"]

RUN ["adduser", "--disabled-password", "--gecos", "''", "dkee"]

USER dkee
WORKDIR /home/dkee
RUN ["git", "clone", "https://github.com/ideal-knee/dotfiles.git"]
RUN ["ln", "-s", "/home/dkee/dotfiles/emacs.d", "/home/dkee/.emacs.d"]
RUN ["ln", "-s", "/home/dkee/dotfiles/gitconfig", "/home/dkee/.gitconfig"]
RUN ["ln", "-s", "/home/dkee/dotfiles/tmux.conf", "/home/dkee/.tmux.conf"]
RUN ["emacs", "--load", "/home/dkee/.emacs.d/init.el","--batch"]

USER root
RUN ["apt-get", "install", "-y", "sbcl"]

USER dkee
WORKDIR /host
