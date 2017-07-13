mkdir build
cd build

export CC=clang CXX=clang++
cmake \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_RTTI=ON \
  -DLLVM_INCLUDE_TESTS=OFF \
  -DLIBCXXABI_LIBCXX_PATH=$PREFIX/include \
  -DBUILD_SHARED_LIBS=on \
  ..

make -j 8
make install

