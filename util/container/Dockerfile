# Copyright 2020 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

FROM ubuntu:22.04 AS base

# apt update and upgrade
RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y \
  build-essential \
  device-tree-compiler \
  curl \
  git \
  gnupg2 \
  lsb-release \
  software-properties-common \
  tar \
  unzip \
  wget \
  zlib1g-dev \
  zsh \
  vim \
  nano 

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup install 1.77.2
RUN rustup override set 1.77.2

# Install Bender
RUN cargo install bender --version 0.28.1

# Install pre-built spike-dasm
RUN wget https://github.com/pulp-platform/riscv-isa-sim/releases/download/snitch-v0.1.0/snitch-spike-dasm-0.1.0-x86_64-linux-gnu-ubuntu18.04.tar.gz && \
    tar xzf snitch-spike-dasm-0.1.0-x86_64-linux-gnu-ubuntu18.04.tar.gz && \
    rm snitch-spike-dasm-0.1.0-x86_64-linux-gnu-ubuntu18.04.tar.gz

# Install LLVM 17 + MLIR + clang-format
RUN wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && ./llvm.sh 17 && rm llvm.sh
RUN apt-get -y install mlir-17-tools
RUN apt-get -y install clang-format-17

# create symbolic links for all *-17 binaries
RUN for f in /usr/bin/*-17; do ln -s $f ${f%-17}; done

# Install Verilator
RUN apt-get install -y \
  git help2man perl make autoconf g++ flex bison ccache \
  libgoogle-perftools-dev numactl perl-doc
RUN apt-get install -y libfl2 libfl-dev zlibc zlib1g zlib1g-dev || true
RUN git clone https://github.com/verilator/verilator && \
  cd verilator && \
  git checkout stable && \
  unset VERILATOR_ROOT && \
  autoconf && \
  ./configure && \
  make -j$(nproc) && \
  make install && \
  cd .. && \
  rm -rf verilator
ENV VLT_ROOT /usr/local/share/verilator

# Change defaults in verilator file
RUN sed -i /usr/local/share/verilator/include/verilated.mk \
        -e "s/CXX = g++/CXX = clang++-17/g" \
        -e "s/LINK = g++/LINK = clang++-17/g" \
        -e "s/AR = ar/AR = llvm-ar-17/g" \
        -e "s/CFG_CXXFLAGS_STD = /CFG_CXXFLAGS_STD = -std=c++20/g" \
        -e "s/CFG_CXXFLAGS_COROUTINES = -fcoroutines/CFG_CXXFLAGS_COROUTINES = /g"


# Install Verible
ENV VERIBLE_VERSION 0.0-3644-g6882622d
RUN wget https://github.com/chipsalliance/verible/releases/download/v${VERIBLE_VERSION}/verible-v${VERIBLE_VERSION}-linux-static-x86_64.tar.gz && \
  mkdir tempdir && \
  tar -x -f verible-v${VERIBLE_VERSION}-linux-static-x86_64.tar.gz --strip-components=1 -C tempdir && \
  cp -rn tempdir/bin/* ./bin/ && \
  rm -rf verible-v${VERIBLE_VERSION}-linux-static-x86_64.tar.gz tempdir


# Install the Chisel Environment
RUN apt-get update && \
  apt-get install -y openjdk-11-jre-headless openjdk-11-jdk-headless

# Install scala-cli
RUN curl -sSLf https://scala-cli.virtuslab.org/get | sh

# Install mill build tool
RUN curl -L https://raw.githubusercontent.com/lefou/millw/0.4.11/millw > mill && chmod +x mill && mv mill /usr/local/bin

# Install sbt
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list && \
  echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list && \
  curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add && \
  apt-get update

RUN apt-get install -y sbt

# Install python 3.11
RUN apt update -y \
 && apt install -y \
      build-essential \
      zlib1g-dev \
      libncurses5-dev \
      libgdbm-dev \
      libnss3-dev \
      libssl-dev \
      libreadline-dev \
      libffi-dev \
      libsqlite3-dev \
      wget \
      libbz2-dev \
      lzma \
      liblzma-dev \
      libbz2-dev \
 && mkdir -p /tmp/python-src \
 && wget -qO- https://www.python.org/ftp/python/3.11.5/Python-3.11.5.tgz | \
    tar xz --strip-components=1 -C /tmp/python-src \
 && cd /tmp/python-src \
 && ./configure --prefix=/opt/python3.11 \
 && make install -j$(nproc)

ENV PATH="${PATH}:/opt/python3.11/bin"

# Install Python Requirements from kuleuven-micas/snax_cluster
RUN git clone https://github.com/kuleuven-micas/snax_cluster.git && \
    cd snax_cluster && pip3 install -r python-requirements.txt && \
    cd .. && \
    rm -rf snax_cluster

# Install Python Requirements from kuleuven-micas/snax-mlir
RUN git clone https://github.com/kuleuven-micas/snax-mlir.git && \
    cd snax-mlir && pip3 install -r requirements.txt && \
    cd .. && \
    rm -rf snax-mlir

# Install Oh-My-Zsh and Autocomplete Plugin
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
RUN chsh -s $(which zsh)

# Zsh as default shell
CMD ["zsh"]

# Default systems
FROM base as snax-mac

RUN git clone https://github.com/kuleuven-micas/snitch_cluster /src
RUN cd /src && git submodule update --init
RUN cd /src && sbt package
RUN cd /src && \
  make -C target/snitch_cluster bin/snitch_cluster.vlt \
  CFG_OVERRIDE=cfg/snax-mac.hjson -j $(nproc)

FROM base as snax-gemm

RUN git clone https://github.com/kuleuven-micas/snitch_cluster /src
RUN cd /src && git submodule update --init
RUN cd /src && sbt package
RUN cd /src && \
  make -C target/snitch_cluster bin/snitch_cluster.vlt \
  CFG_OVERRIDE=cfg/snax-gemm.hjson -j $(nproc)

# Copy Hardware to final image
FROM base as target

COPY --from=snax-mac /src/target/snitch_cluster/bin/snitch_cluster.vlt /opt/snax-mac-rtl/bin/snitch_cluster.vlt
COPY --from=snax-mac /src/sw/snRuntime /opt/snax-mac/sw/snRuntime

COPY --from=snax-gemm /src/target/snitch_cluster/bin/snitch_cluster.vlt /opt/snax-gemm/bin/snitch_cluster.vlt
COPY --from=snax-gemm /src/sw/snRuntime /opt/snax-gemm/sw/snRuntime
