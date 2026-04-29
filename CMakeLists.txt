cmake_minimum_required(VERSION 4.2)
project(Modulo_de_Compras_Sitema__EPR)

set(CMAKE_CXX_STANDARD 14)

include_directories(.)
include_directories(.idea)
include_directories(data)
include_directories(include)
include_directories(public)
include_directories(src)

add_executable(Modulo_de_Compras_Sitema__EPR
        .idea/.gitignore
        .idea/workspace.xml
        data/fornecedores.txt
        data/ordens.txt
        include/ComprasException.h
        include/EstoqueMock.h
        include/FinanceiroMock.h
        include/Fornecedor.h
        include/GerenciadorFornecedores.h
        include/GerenciadorOrdens.h
        include/IEstoque.h
        include/IExibivel.h
        include/IFinanceiro.h
        include/IProducao.h
        include/ListaGenerica.h
        include/ModuloCompras.h
        include/OrdemCompra.h
        include/PersistenciaCompras.h
        include/Pessoa.h
        include/ProducaoMock.h
        src/GerenciadorFornecedores.cpp
        src/GerenciadorOrdens.cpp
        src/main.cpp
        src/ModuloCompras.cpp
        src/PersistenciaCompras.cpp)
