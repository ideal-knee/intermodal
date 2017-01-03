FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
  curl           \
  emacs          \
  git            \
  man            \
  openssh-server \
  tmux           \
  tree

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk

RUN curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod a+x /usr/local/bin/lein

RUN apt-get update && apt-get install -y \
  vim           \
  ruby

ARG user
RUN useradd --shell /bin/bash $user

RUN mkdir /var/run/sshd
EXPOSE 22
ENTRYPOINT echo "Starting SSH server..." && /usr/sbin/sshd -D
