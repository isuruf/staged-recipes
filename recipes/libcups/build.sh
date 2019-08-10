if [[ "$target_platform" == linux* ]]; then
    export LIBS="-lrt"
fi

export LIBTOOL=$PREFIX/bin/libtool
./configure --prefix=$PREFIX --with-components=core
make -j${CPU_COUNT}
#fails due to some network issue
#make check
make install
