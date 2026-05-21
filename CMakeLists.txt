cmake_minimum_required(VERSION 3.10)
project(Modulo_Compras_ERP)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)
include_directories(src)

add_executable(Modulo_Compras_ERP
        src/GerenciadorFornecedores.cpp
        src/GerenciadorOrdens.cpp
        src/main.cpp
        src/ModuloCompras.cpp
        src/PersistenciaCompras.cpp)

# Threading (usado em GerenciadorOrdens)
find_package(Threads REQUIRED)
target_link_libraries(Modulo_Compras_ERP Threads::Threads)

# Avisos do compilador
if(MSVC)
    target_compile_options(Modulo_Compras_ERP PRIVATE /W4 /utf-8)
else()
    target_compile_options(Modulo_Compras_ERP PRIVATE -Wall -Wextra)
endif()

message(STATUS "Modulo_Compras_ERP configurado com sucesso!")
message(STATUS "Executavel: Modulo_Compras_ERP")
