export GHC_OLD_DIR=`pwd`/binary
mkdir -p $GHC_OLD_DIR/lib

#export GHC_OLD_VERSION=${PKG_VERSION}
export GHC_OLD_VERSION="8.2.1"

if [ "$(uname)" == "Linux" ]
then
    curl -L -O https://downloads.haskell.org/~ghc/${GHC_OLD_VERSION}/ghc-${GHC_OLD_VERSION}-x86_64-centos67-linux.tar.xz
    tar -xvf ghc-${GHC_OLD_VERSION}-x86_64-centos67-linux.tar.xz
elif [ "$(uname)" == "Darwin" ]
then
    curl -L -O https://downloads.haskell.org/~ghc/${GHC_OLD_VERSION}/ghc-${GHC_OLD_VERSION}-x86_64-apple-darwin.tar.xz
    tar -xvf ghc-${GHC_OLD_VERSION}-x86_64-apple-darwin.tar.xz
else
    echo "This system is unsupported."
    exit 1
fi


# Install an older binary version of ghc
cd ghc-${GHC_OLD_VERSION}
export LD_LIBRARY_PATH=$GHC_OLD_DIR/lib
./configure --prefix=$GHC_OLD_DIR
make install
cd ..

# Install ghc from source
export PATH=$PATH:$GHC_OLD_DIR/bin
./configure --prefix=$PREFIX
make
make install

