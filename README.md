What is this
============
This is environments that was composed by linux container for [Luckfox Pico SDK](https://github.com/LuckfoxTECH/luckfox-pico/).

Depends
==============
- docker
  - docker-compose

Example environment
========
- My environments
  - Laptop: Macbook Air (Apple Silicon M1 inside)
  - Container environment: Colima x64 mode (docker compatible that can use socket by 'docker context use' command.)

Usage
===========
Run the host machine.
```bash
$ make shell
```

The virtual machine appear console.
Run next.
```bash
$ ./build.sh
```

Deliverables
============
Deliverables are wrote `output` directory.

Usable command in virtual environments
=======
```bash
$ ./build.sh --help

Usage: build.sh [OPTIONS]
Available options:
lunch              -Select Board Configure
env                -build env
meta               -build meta (optional)
uboot              -build uboot
kernel             -build kernel
rootfs             -build rootfs
driver             -build kernels drivers
sysdrv             -build uboot, kernel, rootfs
media              -build rockchip media libraries
app                -build app
recovery           -build recovery
tool               -build tool
updateimg          -build update image
unpackimg          -unpack update image
factory            -build factory image
all                -build uboot, kernel, rootfs, recovery image
allsave            -build all & firmware & save

clean              -clean all
clean uboot        -clean uboot
clean kernel       -clean kernel
clean driver       -clean driver
clean rootfs       -clean rootfs
clean sysdrv       -clean uboot/kernel/rootfs
clean media        -clean rockchip media libraries
clean app          -clean app
clean recovery     -clean recovery

firmware           -pack all the image we need to boot up system
ota                -pack update_ota.tar
save               -save images, patches, commands used to debug
check              -check the environment of building
info               -see the current board building information

Default option is 'allsave'.
```

see also...
[LuckfoxTECH/luckfox-pico in github.com](https://github.com/LuckfoxTECH/luckfox-pico/)

FIY
=====
if you want to run by colima(not docker-desktop) cause you have apple silicon inside machine, you might to launch command next.
```bash
colima start --profile x64 --arch x86_64
```