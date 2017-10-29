mkdir build
cd build

set PROCESSOR_ARCHITECTURE="AMD64"

cmake -G "NMake Makefiles" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    -DCLANG_INCLUDE_TESTS=OFF ^
    -DCLANG_INCLUDE_DOCS=OFF ^
    -DLLVM_INCLUDE_TESTS=OFF ^
    -DLLVM_INCLUDE_DOCS=OFF ^
    -DLLVM_TARGETS_TO_BUILD=X86 ^
    %SRC_DIR%

if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

xcopy bin\ %LIBRARY_BIN%\ /E
xcopy lib\ %LIBRARY_LIB%\ /E
if errorlevel 1 exit 1
