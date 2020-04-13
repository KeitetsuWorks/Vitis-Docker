##
## @file        Dockerfile
## @brief       Dockerfile for Vitis
## @author      Keitetsu
## @date        2020/04/13
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM ubuntu:18.04

LABEL maintainer="KeitetsuWorks@users.noreply.github.com"

##
## install Vitis dependencies
##
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq --no-install-recommends \
        tofrodos \
        iproute2 \
        gawk \
        gcc-4.8 \
        make \
        net-tools \
        libncurses5-dev \
        libncursesw5-dev \
        libssl-dev \
        flex \
        bison \
        libselinux1 \
        gnupg \
        wget \
        diffstat \
        chrpath \
        socat \
        xterm \
        autoconf \
        libtool \
        tar \
        unzip \
        texinfo \
        zlib1g-dev \
        g++-multilib \
        gcc-multilib \
        build-essential \
        screen \
        pax \
        gzip \
        python2.7 \
        python3 \
        binutils \
        cpio \
        expect \
        file \
        fonts-noto-cjk \
        git \
        gosu \
        lib32z1-dev \
        libc6 \
        libglib2.0-dev \
        libgtk2.0-0 \
        libjpeg62-dev \
        libsdl1.2-dev \
        libstdc++6 \
        libtool-bin \
        libxi6 \
        libxrender1 \
        libxtst6 \
        locales \
        lsb-release \
        ncurses-dev \
        ocl-icd-libopencl1 \
        ocl-icd-opencl-dev \
        opencl-headers \
        pkg-config \
        software-properties-common \
        sudo \
        u-boot-tools \
        vim \
        xvfb && \
    \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq --no-install-recommends \
        zlib1g:i386 \
        dpkg-dev:i386 \
        libc6:i386 \
        libc6-dev:i386 \
        libgtk2.0-0:i386 \
        libncurses5:i386 \
        libstdc++6:i386 && \
    apt-get clean && \
    apt-get autoclean && \
    ln -fs /bin/bash /bin/sh && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

##
## locale settings
##
RUN locale-gen en_US.UTF-8 && \
    update-locale
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

##
## vim settings
##
RUN cd ~ && \
    git clone --depth 1 https://github.com/tomasr/molokai.git && \
    mkdir -p ~/.vim/colors && \
    mv ./molokai/colors/molokai.vim ~/.vim/colors && \
    rm -rf ./molokai && \
    git clone --depth 1 https://github.com/KeitetsuWorks/VimSettings.git && \
    mv ./VimSettings/.vimrc ~ && \
    rm -rf ./VimSettings && \
    sed -i -e "/^colorscheme.*/i set t_Co=256" .vimrc && \
    cp -r ~/.vim /etc/skel && \
    cp ~/.vimrc /etc/skel

##
## Xilinx Vitis settings
##
COPY files/init_vitis.sh /usr/local/bin/init_vitis.sh
RUN chmod +x /usr/local/bin/init_vitis.sh && \
    echo '. /usr/local/bin/init_vitis.sh' >> /root/.bashrc && \
    echo '. /usr/local/bin/init_vitis.sh' >> /etc/skel/.bashrc

##
## make installation directory
##
RUN mkdir -p /opt/Xilinx

##
## ENTRYPOINT settings
##
COPY files/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash", "-l"]
