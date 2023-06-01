#! /bin/bash

if [ $1 == "build" ];then
make mx6ull_14x14_evk_defconfig
make -j4
fi

if [ $1 == "config" ];then
make mx6ull_14x14_evk_defconfig
fi

if [ $1 == "clean" ];then
make distclean
make clean
make mrproper
fi

if [ $1 == "clean_and_build" ];then
make distclean
make clean
make mrproper
make mx6ull_14x14_evk_defconfig
make -j4
fi
