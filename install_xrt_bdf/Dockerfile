##
## @file        Dockerfile
## @brief       Dockerfile for Vitis
## @author      Keitetsu
## @date        2020/04/14
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM keitetsu/vitis:ubuntu18.04-v2019.2-1

##
## install XRT
##
RUN cd /tmp && \
    wget \
        -O xrt_201920.2.3.1301_18.04-xrt.deb \
        https://www.xilinx.com/bin/public/openDownload?filename=xrt_201920.2.3.1301_18.04-xrt.deb && \
    apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq \
        ./xrt_201920.2.3.1301_18.04-xrt.deb && \
    apt-get clean && \
    apt-get autoclean && \
    \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/cache/* && \
    rm -rf /var/lib/apt/lists/*

##
## install board files
##
RUN cd /tmp && \
    git clone \
        https://github.com/Avnet/bdf.git \
        avnet_bdf && \
    cd avnet_bdf && \
    git checkout 1751d123d98e1a5ed6b1308942742e7134f21d56 && \
    rm README.md download_zip.png locate_zip.png && \
    cp -r * /opt/Xilinx/Vivado/2019.2/data/boards/board_files && \
    \
    cd /tmp && \
    git clone \
        https://github.com/Digilent/vivado-boards.git \
        digilent_bdf && \
    cd digilent_bdf && \
    git checkout 2bb8cde0ab19ff31bc8f0e43780f9d98f6578e0f && \
    cp -r new/board_files/* /opt/Xilinx/Vivado/2019.2/data/boards/board_files && \
    \
    cd /tmp && \
    rm -rf /tmp/*

