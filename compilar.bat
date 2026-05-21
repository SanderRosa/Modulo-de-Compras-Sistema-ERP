@echo off
title Modulo Compras ERP - Compilador
color 0B
echo.
echo  =======================================
echo   MODULO DE COMPRAS ERP - Compilador
echo  =======================================
echo.

set ENV_PATH=C:\Users\sande\AppData\Local\Microsoft\WinGet\Packages\BrechtSanders.WinLibs.POSIX.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe\mingw64\bin
set "PATH=%ENV_PATH%;%PATH%"

where g++ >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] g++ nao encontrado!
    echo Instale com: winget install BrechtSanders.WinLibs.POSIX.UCRT
    pause & exit /b 1
)

if not exist "build" mkdir build

echo  Compilando...
g++ -std=c++17 -Wall -O2 -Iinclude -Isrc ^
    src\main.cpp ^
    src\GerenciadorFornecedores.cpp ^
    src\GerenciadorOrdens.cpp ^
    src\ModuloCompras.cpp ^
    src\PersistenciaCompras.cpp ^
    -lpthread ^
    -o build\Modulo_Compras_ERP.exe

if %errorlevel% neq 0 (
    color 0C
    echo [ERRO] Falha na compilacao!
    pause & exit /b 1
)

color 0A
echo  [OK] Compilado: build\Modulo_Compras_ERP.exe
echo.
set /p RODAR="  Executar agora? (S/N): "
if /i "%RODAR%"=="S" (
    echo.
    cd build
    Modulo_Compras_ERP.exe
)
pause
