#!/bin/bash

benchmark=mcf_s

build/X86/gem5.opt \
--outdir=/ext/anis8367/dolma/$benchmark \
configs/example/fs.py \
--mem-type SimpleMemory \
--checkpoint-dir=../gem5/checkpoint/$benchmark/x86 -r 2 \
--disk-image=/home/anis8367/gem5/../m5_binaries/disks/spec-2017 \
--kernel=/home/anis8367/gem5/../m5_binaries/binaries/vmlinux-4.19.83 \
--script=../../gem5/script/$benchmark.rcS \
--cpu-type=DerivO3CPU \
--mem-size=4GB  \
--cpu-clock 2GHz --sys-clock 2GHz \
--l1d_size 32kB --l1d_assoc 8 --l1i_size 32kB \
--l1i_assoc 8 --l2_size 2MB --l2_assoc 16 --l2cache --caches \
--maxinsts=20000000