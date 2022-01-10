#!/bin/bash

echo "--- Fetching prebuilt Dependencies ---"
wget https://github.com/OGRECave/ogre-next-deps/releases/download/bin-releases/Dependencies_Release_Ubuntu.18.04.LTS.Clang.7z

echo "--- Extracting prebuilt Dependencies ---"
7z x Dependencies_Release_Ubuntu.18.04.LTS.Clang.7z

mkdir -p build/Debug
cd build/Debug
echo "--- Building Ogre (Debug) ---"
cmake \
-DOGRE_CONFIG_THREAD_PROVIDER=0 \
-DOGRE_CONFIG_THREADS=0 \
-DOGRE_BUILD_COMPONENT_SCENE_FORMAT=1 \
-DOGRE_BUILD_SAMPLES2=1 \
-DOGRE_BUILD_TESTS=1 \
-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=1 \
-DCMAKE_BUILD_TYPE="Debug" \
-DCMAKE_CXX_STANDARD=11 \
-G Ninja ../.. || exit $?
ninja || exit $?
ninja install || exit $?

echo "Done!"