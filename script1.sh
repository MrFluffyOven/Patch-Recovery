#!/bin/bash

if [ -f vendor_boot.img.lz4 ];then
	lz4 -B6 --content-size -f vendor_boot.img.lz4 vendor_boot.img
fi

off=$(grep -ab -o SEANDROIDENFORCE vendor_boot.img |tail -n 1 |cut -d : -f 1)
dd if=vendor_boot.img of=r.img bs=4k count=$off iflag=count_bytes

if [ ! -f phh.pem ];then
    openssl genrsa -f4 -out phh.pem 4096
fi
