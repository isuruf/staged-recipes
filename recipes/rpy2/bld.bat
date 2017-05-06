:: See: https://github.com/conda/conda-recipes/blob/master/python/rpy2/bld.bat
::
:: Mixing MS CRT headers and mingw-w64 headers doesn't work
:: so build the whole thing with mingw-w64 instead.
echo [build]              > setup.cfg
echo compiler = mingw32  >> setup.cfg
set CFLAGS=-D__USE_MINGW_ANSI_STDIO

:: Create an empty library for msvcrt??? since CygwinCCompiler seems to
:: think that linking to that is a good idea (it is not).
if "%CONDA_PY%" == "36" (
  ar cru %PREFIX%\libs\libmsvcr140.dll.a
) else (
  if "%CONDA_PY%" == "35" (
    ar cru %PREFIX%\libs\libmsvcr140.dll.a
  ) else (
    if "%CONDA_PY%" == "34" (
      ar cru %PREFIX%\libs\libmsvcr120.dll.a
    ) else (
      ar cru %PREFIX%\libs\libmsvcr90.dll.a
    )
  )
)

gendef %PREFIX%\python%CONDA_PY%.dll - > python%CONDA_PY%.def
dlltool -d python%CONDA_PY%.def -l %PREFIX%\lib\libpython%CONDA_PY%.dll.a

set CPATH=%PREFIX%/R/include
python setup.py install --single-version-externally-managed --record=record.txt

:: Cleanup the libs we made:
del %PREFIX%\libs\libpython%CONDA_PY%.dll.a
if "%CONDA_PY%" == "36" (
  del %PREFIX%\libs\libmsvcr140.dll.a
) else (
  if "%CONDA_PY%" == "35" (
    del %PREFIX%\libs\libmsvcr140.dll.a
  ) else (
    if "%CONDA_PY%" == "34" (
      del %PREFIX%\libs\libmsvcr120.dll.a
    ) else (
      del %PREFIX%\libs\libmsvcr90.dll.a
    )
  )
