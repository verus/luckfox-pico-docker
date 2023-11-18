FROM ubuntu:22.04
LABEL authors="verus"

WORKDIR /root

RUN apt-get -y update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y  install git ssh make gcc gcc-multilib g++-multilib module-assistant expect g++ gawk texinfo libssl-dev  \
                bison flex fakeroot cmake unzip gperf autoconf device-tree-compiler libncurses5-dev pkg-config bc \
                python-is-python3 passwd openssl openssh-server openssh-client vim file cpio rsync
RUN apt-get -y clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/LuckfoxTECH/luckfox-pico.git /root/luckfox-pico
ENV PATH $PATH:/root/luckfox-pico/tools/linux/toolchain/arm-rockchip830-linux-uclibcgnueabihf/bin

ENTRYPOINT ["/bin/bash", "-c", "/root/luckfox-pico/build.sh"]
CMD ["launch"]