FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl           \
  emacs          \
  git            \
  man            \
  openssh-server \
  tmux           \
  tree

ARG user
RUN useradd --shell /bin/bash $user

RUN mkdir /var/run/sshd
EXPOSE 22
ENTRYPOINT echo "Starting SSH server..." && /usr/sbin/sshd -D
