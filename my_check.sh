#!/bin/bash

# Change the gcc binary
sed -i 's/gcc-10\|gcc-9/gcc/g' Makefile

echo "Executing the test cases"

pkill qemu-system-x86
pkill qemu-system-i386
make clean

make xv6.img
#make

arr=(1 2 3 4 5)
# arr=(0)
log_header="logflag.h"
RECOV=0

for idx in "${!arr[@]}"; do
    echo "Running...${arr[idx]}"

    echo 00000 > hello.txt
    make fs.img > /dev/null

    sed -i "s/\(#define LOG_FLAG \)\(-1\|[0-9]\+\)/\1${arr[idx]}/" "$log_header"
    cat ${log_header}
    timeout 30s ./test_lab2.sh 1  > res_panic_$idx

    sed -i "s/\(#define LOG_FLAG \)\(-1\|[0-9]\+\)/\1${RECOV}/" "$log_header"
    cat ${log_header}
    timeout 30s ./test_lab2.sh 1 > res_recovery_$idx
done

