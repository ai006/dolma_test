#!/bin/bash

echo "running spec2017"

declare -a benchmarks=("gcc_s" "lbm_s" "nab_s" "pop2_s" "x264_s"
	"cactuBSSN_s" "exchange2_s" "leela_s" "omnetpp_s"  "roms_s" "xalancbmk_s"
	"cam4_s" "fotonik3d_s" "imagick_s" "mcf_s" "perlbench_s" "wrf_s" "xz_s")

declare -a inputs=("gcc-pp.c -O5 -fipa-pta" "2000 reference.dat 0 0 200_200_260_ldc.o"
        "3j1n 20140317 220" " " "--pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720"
        "spec_ref.par" "6" "ref.sgf" "-c General -r 0" "< ocean_benchmark3.in" "-v t5.xml xalanc.xsl" " "
        " " "-limit disk 0 refspeed_input.tga -resize 817% -rotate -2.76 -shave 540x375 -alpha remove -auto-level -contrast-stretch 1x1% -colorspace Lab -channel R -equalize +channel -colorspace sRGB -define histogram:unique-colors=false -adaptive-blur 0x5 -despeckle -auto-gamma -adaptive-sharpen 55 -enhance -brightness-contrast 10x10 -resize 30% refspeed_output.tga" 
        "inp.in" "-I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1" " " "cpu2006docs.tar.xz 6643 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1036078272 1111795472 4")

declare -a binaries=()

for benchmark in "${benchmarks[@]}"
do
	echo "running $benchmark..."
	build/X86/gem5.opt \
	--outdir=PLACE_PATH_HERE/$benchmark \
	configs/example/se.py \
    --mem-type SimpleMemory
    --cmd=PLACE_PATH_OF_BINARY_HERE \
    --options=PLACE_PATH_OF_INPUTS_HERE
	--cpu-type=DerivO3CPU \
	--cpu-clock 2GHz --sys-clock 2GHz \
	--l1d_size 32kB --l1d_assoc 8 --l1i_size 32kB \
	--l1i_assoc 8 --l2_size 2MB --l2_assoc 16 --l2cache --caches \
	--mode 2 \
    --stt False \
    --fastforward=1000000000 \
	--maxinsts=500000000 &
done

echo "finished starting all the benchmark"