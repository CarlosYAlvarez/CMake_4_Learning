# Building without presets
```
cmake \
    -B build \
    -DCMAKE_C_COMPILER=/usr/bin/gcc-13 \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_CXX_EXTENSIONS=ON \
    -DTUTORIAL_BUILD_UTILITIES=OFF
```

# Building a preset
Presets are defined in [cmake-presets](https://cmake.org/cmake/help/git-master/manual/cmake-presets.7.html)

1) If `binaryDir` is defined as: `"binaryDir": "${sourceDir}/build"`

```
cmake --preset <presetName>
cmake --build build
```

2) If `binaryDir` is not defined:

```
cmake -B build --preset <presetName>
cmake --build build
```

If you were to build as just `cmake --preset <presetName>` without `binaryDir` being defined, all the build files would be placed under the `sourceDir` directory (current directory).
