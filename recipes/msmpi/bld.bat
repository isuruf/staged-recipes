
cd src

set "SRCROOT=%SRC_DIR%\src"
set "MPI_SRC_ROOT=%SRC_DIR%\src\mpi"
set "MPI_INC_ROOT=%SRC_DIR%\src\include"
set "MPI_INC_PATH=%SRC_DIR%\src\include"

msbuild msmpi.sln /p:PlatformToolset=v140 /p:Configuration=Release
