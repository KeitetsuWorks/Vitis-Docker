##
## @file        Dockerfile
## @brief       Dockerfile for Vitis
## @author      Keitetsu
## @date        2020/04/14
## @copyright   Copyright (c) 2020 Keitetsu
## @par         License
##              This software is released under the MIT License.
##

FROM keitetsu/vitis:ubuntu18.04-v2020.2-1

##
## install XRT
##
RUN cd /tmp && \
    wget \
        -O xrt_202020.2.8.743_18.04-amd64-xrt.deb \
        https://www.xilinx.com/bin/public/openDownload?filename=xrt_202020.2.8.743_18.04-amd64-xrt.deb && \
    apt-get update && \
    apt-get upgrade -y -qq && \
    apt-get install -y -qq \
        ./xrt_202020.2.8.743_18.04-amd64-xrt.deb && \
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
    git checkout 2d1f2d3a0a4350ebd862c14d1148dabd010725ae && \
    rm README.md download_zip.png locate_zip.png && \
    cp -r * /opt/Xilinx/Vivado/2020.2/data/boards/board_files && \
    \
    cd /tmp && \
    git clone \
        https://github.com/Digilent/vivado-boards.git \
        digilent_bdf && \
    cd digilent_bdf && \
    git checkout 18d7d68c415e31afdcdcd56ad2d281dca1e51d6c && \
    cp -r new/board_files/* /opt/Xilinx/Vivado/2020.2/data/boards/board_files && \
    \
    cd /tmp && \
    rm -rf /tmp/*

