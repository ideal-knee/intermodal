FROM ubuntu:16.04

# Dev basics
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "emacs", "git", "tmux", "tree", "curl"]

# Dev user
RUN ["adduser", "--disabled-password", "--gecos", "''", "dkee"]

# Dev setup
USER dkee
WORKDIR /home/dkee
RUN ["git", "clone", "https://github.com/ideal-knee/dotfiles.git"]
RUN ["ln", "-s", "/home/dkee/dotfiles/emacs.d", "/home/dkee/.emacs.d"]
RUN ["ln", "-s", "/home/dkee/dotfiles/gitconfig", "/home/dkee/.gitconfig"]
RUN ["ln", "-s", "/home/dkee/dotfiles/tmux.conf", "/home/dkee/.tmux.conf"]
RUN ["emacs", "--load", "/home/dkee/.emacs.d/init.el","--batch"]

# Common Lisp
USER root
RUN ["apt-get", "install", "-y", "sbcl"]

# Ruby
USER root
RUN ["apt-get", "install", "-y", "ruby-full"]

# Clojure
USER root
RUN ["apt-get", "install", "-y", "openjdk-8-jre"]
ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/local/bin/lein
RUN ["chmod", "755", "/usr/local/bin/lein"]
USER dkee
RUN lein

USER dkee
WORKDIR /host
