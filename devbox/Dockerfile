FROM ubuntu:xenial

# Basic dev tools
RUN apt-get update && apt-get install -y \
  curl           \
  emacs          \
  git            \
  man            \
  openssh-server \
  tmux           \
  tree

# Java
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk

# Leiningen
RUN curl -o /usr/local/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && \
    chmod a+x /usr/local/bin/lein

# Ruby and Vim
RUN apt-get update && apt-get install -y \
  vim           \
  ruby

# exercism.io
WORKDIR /tmp
RUN curl -LO https://github.com/exercism/cli/releases/download/v2.3.0/exercism-linux-64bit.tgz && \
    tar -xzvf exercism-linux-64bit.tgz && \
    mv exercism /usr/local/bin/

# User account
ARG user
RUN useradd --shell /bin/bash $user

RUN mkdir /var/run/sshd
EXPOSE 22
ENTRYPOINT echo "Starting SSH server..." && /usr/sbin/sshd -D
