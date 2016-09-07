@echo off
setlocal enableextensions

if "%1" == "" (
    echo Ussage: %0 ^<path to clcache.exe^>
    exit /b 1
)

set clcache_path=%~dp1%
set clcache_exe=%~nx1%

set x=%VSINSTALLDIR%
if "%x%" == "" (
    call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" amd64
)

msbuild ^
    /nr:false ^
    /nologo ^
    /p:Platform=x64 ^
    /p:Configuration=Release ^
    /p:CLToolPath=%clcache_path% ^
    /p:CLToolExe=%clcache_exe% ^
    /p:DebugType=None ^
    /p:DebugSymbols=false ^
    clcache-incremental-test.sln