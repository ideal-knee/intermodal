FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl  \
  emacs \
  git   \
  tmux  \
  tree

ARG user
RUN useradd $user
WORKDIR /home/$user
USER $user

ENTRYPOINT eval $(ssh-agent) && ssh-add && bash
