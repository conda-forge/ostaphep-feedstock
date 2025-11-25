#!/bin/bash

mkdir -p build-dir
cd build-dir

cmake $CMAKE_ARGS \
    -DPython3_EXECUTABLE=$PYTHON \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_NAME_DIR="${PREFIX}/lib" \
    -G Ninja \
    ../ostap

ninja -j${CPU_COUNT}
ninja -j${CPU_COUNT}
ninja install
ninja -j${CPU_COUNT}
ninja install

if [ -e "${PREFIX}"/./thisostap.sh ]; then
    rm "${PREFIX}"/./thisostap.*
fi
