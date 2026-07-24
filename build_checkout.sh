#!/bin/sh

git clone https://github.com/upx/upx.git --dept 1
cd upx
git submodule update --init --recursive

cmake -B build -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_EXE_LINKER_FLAGS="-static -static-pie -no-pie -s" \
-DCMAKE_CXX_FLAGS="-static -static-pie -no-pie"
cmake --build build -j$(nproc)


file build/upx
du -sh build/upx
ldd build/upx
