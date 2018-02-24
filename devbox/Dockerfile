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

# Node
RUN apt-get update && apt-get install -y nodejs

# cc (for Rust)
RUN apt-get update && apt-get install -y build-essential

# Common Lisp
RUN apt-get update && apt-get install -y sbcl

# boot
RUN bash -c "cd /usr/local/bin && curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh && chmod 755 boot"

# rbenv and Ruby dependencies
RUN apt-get update && apt-get install -y \
    autoconf \
    bison \
    build-essential \
    libssl-dev \
    libyaml-dev \
    libreadline6-dev \
    zlib1g-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm3 \
    libgdbm-dev

# AWS CLI
RUN apt-get update && apt-get install -y \
    python-pip
RUN pip install --upgrade pip
RUN pip install awscli --upgrade

# MTR
RUN apt-get update && apt-get install -y \
    mtr

# Neanderthal
RUN apt-get update && apt-get install -y \
    cpio
WORKDIR /tmp
RUN curl -LO http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/12147/l_mkl_2017.4.239.tgz && \
    tar -xzvf l_mkl_2017.4.239.tgz
ADD mkl.cfg /tmp/
WORKDIR /tmp/l_mkl_2017.4.239
RUN ./install.sh  --silent /tmp/mkl.cfg && \
    rm /tmp/l_mkl_2017.4.239.tgz && \
    rm -rf /tmp/l_mkl_2017.4.239
RUN echo "/opt/intel/compilers_and_libraries_2017.5.239/linux/mkl/lib/intel64_lin/" > /etc/ld.so.conf.d/mkl.conf && \
    ldconfig

# JQ
RUN apt-get update && apt-get install -y \
    jq

# User account
ARG user
RUN useradd --shell /bin/bash $user

RUN mkdir /var/run/sshd
EXPOSE 22
ENTRYPOINT echo "Starting SSH server..." && /usr/sbin/sshd -D
