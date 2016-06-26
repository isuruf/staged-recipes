if "%ARCH%"=="32" (
    set PLATFORM=Win32
) else (
    set PLATFORM=x64
)

mkdir dll\%PLATFORM%\Release
mkdir lib\%PLATFORM%\Release

set flint_root=%cd%
cd ..

for %%d in (mpir, mpfr, pthreads) do (
    mkdir %%d\dll\%PLATFORM%\Release
    mkdir %%d\lib\%PLATFORM%\Release

    REM copy libraries
    copy %LIBRARY_BIN%\%%d.dll %%d\dll\%PLATFORM%\Release\%%d.dll
    copy %LIBRARY_LIB%\%%d.lib %%d\dll\%PLATFORM%\Release\%%d.lib
    copy %LIBRARY_LIB%\%%d_static.lib %%d\lib\%PLATFORM%\Release\%%d.lib
)

REM copy headers
xcopy %LIBRARY_INC%\*.h mpir\lib\%PLATFORM%\Release\ /E
xcopy %LIBRARY_INC%\*.h mpir\dll\%PLATFORM%\Release\ /E

cd %flint_root%\build.vc14
cd flint_config
python %cd%\flint_config.py --build-dll True --build-lib True --build-tests False --build-profiles False

cd ..
msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release lib_flint\lib_flint.vcxproj
msbuild.exe /p:Platform=%PLATFORM% /p:Configuration=Release dll_flint\dll_flint.vcxproj

copy dll_flint\%PLATFORM%\Release\dll_flint.lib %LIBRARY_LIB%\flint.lib
copy dll_flint\%PLATFORM%\Release\dll_flint.dll %LIBRARY_BIN%\dll_flint.dll
copy dll_flint\%PLATFORM%\Release\dll_flint.pdb %LIBRARY_BIN%\flint.pdb

copy lib_flint\%PLATFORM%\Release\lib_flint.lib %LIBRARY_LIB%\flint_static.lib

cd ..
mkdir %LIBRARY_INC%\flint
xcopy dll\%PLATFORM%\Release\*.h %LIBRARY_INC%\flint\ /E
REM xcopy dll\%PLATFORM%\Release\flintxx\*.h %LIBRARY_INC%\flint\flintxx\ /E
