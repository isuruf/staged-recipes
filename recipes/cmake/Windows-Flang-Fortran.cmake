include(Platform/Windows-Clang)
__windows_compiler_clang(Fortran)
set(CMAKE_Fortran_COMPILE_OBJECT "<CMAKE_Fortran_COMPILER> ${_COMPILE_Fortran} <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> -c <SOURCE>")
