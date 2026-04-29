# 🏭 Módulo de Compras — Sistema ERP em C++

> Módulo de compras completo para um sistema ERP (Enterprise Resource Planning), implementado em C++ com Programação Orientada a Objetos, interfaces abstratas e persistência em arquivo.

---

## 📋 Sobre o Projeto

O **Módulo de Compras ERP** é uma aplicação de console em C++ que simula o setor de compras de uma empresa industrial. Ele integra gerenciamento de fornecedores, ordens de compra, controle de estoque, pedidos de produção e módulo financeiro, tudo comunicando-se via interfaces abstratas para garantir baixo acoplamento e alta coesão.

---

## 🌟 Funcionalidades

| # | Funcionalidade | Módulo |
|---|---|---|
| 1 | Cadastrar Fornecedor | Compras |
| 2 | Listar Fornecedores | Compras |
| 3 | Criar Ordem de Compra (com aprovação automática) | Compras |
| 4 | Listar Ordens de Compra | Compras |
| 5 | Exibir Estatísticas | Compras |
| 6 | Investigar Fornecedor na Web (URL gerada) | Compras |
| 7 | Consultar Item do Estoque | Estoque |
| 8 | Listar Todos os Itens | Estoque |
| 9 | Reservar Material | Estoque |
| 10 | Criar Pedido de Material para Produção | Produção |
| 11 | Listar Pedidos Pendentes | Produção |
| 12 | Listar Contas a Pagar | Financeiro |
| 13 | Consultar Saldo Disponível | Financeiro |
| 14 | Salvar Dados em Arquivo | Sistema |
| 15 | Carregar Dados do Arquivo | Sistema |

---

## 🏗️ Estrutura do Projeto

```
Modulo de Compras Sistema ERP/
├── include/
│   ├── ModuloCompras.h          # Fachada principal do sistema
│   ├── Fornecedor.h             # Entidade Fornecedor (herda Pessoa)
│   ├── OrdemCompra.h            # Entidade Ordem de Compra
│   ├── GerenciadorFornecedores.h
│   ├── GerenciadorOrdens.h
│   ├── PersistenciaCompras.h    # Interface de persistência
│   ├── ListaGenerica.h          # Container genérico (template)
│   ├── IEstoque.h               # Interface de Estoque
│   ├── IFinanceiro.h            # Interface Financeira
│   ├── IProducao.h              # Interface de Produção
│   ├── IExibivel.h              # Interface de exibição
│   ├── EstoqueMock.h            # Implementação simulada do Estoque
│   ├── FinanceiroMock.h         # Implementação simulada do Financeiro
│   ├── ProducaoMock.h           # Implementação simulada da Produção
│   ├── Pessoa.h                 # Classe base abstrata
│   └── ComprasException.h       # Exceções customizadas
│
└── src/
    ├── main.cpp                 # Interface de console e menu principal
    ├── ModuloCompras.cpp        # Lógica de negócio principal
    ├── GerenciadorFornecedores.cpp
    ├── GerenciadorOrdens.cpp
    └── PersistenciaCompras.cpp  # Leitura/escrita em arquivo
```

---

## 🛠️ Tecnologias e Padrões

| Conceito | Aplicação |
|---|---|
| **C++ (OOP)** | Classes, herança, polimorfismo |
| **Interfaces Abstratas** | `IEstoque`, `IFinanceiro`, `IProducao` |
| **Templates** | `ListaGenerica<T>` para coleções tipadas |
| **Exceções** | `ComprasException` para erros de negócio |
| **Padrão Façade** | `ModuloCompras` centraliza todos os subsistemas |
| **CMake** | Sistema de build multiplataforma |
| **Persistência** | Arquivo binário/texto via `PersistenciaCompras` |

---

## 🚀 Como Compilar

### Usando CMake
```bash
mkdir cmake-build-debug
cd cmake-build-debug
cmake ..
cmake --build .
```

### Executar
```bash
./ModuloComprasERP
```

---

## 📌 Arquitetura

O sistema segue o padrão **Façade**: a classe `ModuloCompras` centraliza o acesso a todos os subsistemas. Os módulos de Estoque, Financeiro e Produção são injetados via interfaces, permitindo substituição fácil das implementações mock por implementações reais.

```
main.cpp
    └── ModuloCompras (Façade)
            ├── GerenciadorFornecedores
            ├── GerenciadorOrdens
            ├── IEstoque (EstoqueMock)
            ├── IFinanceiro (FinanceiroMock)
            ├── IProducao (ProducaoMock)
            └── PersistenciaCompras
```
