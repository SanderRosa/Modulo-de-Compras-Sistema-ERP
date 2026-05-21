# 🏭 Módulo de Compras — Sistema ERP em C++

> Módulo de compras completo para um sistema ERP (Enterprise Resource Planning), implementado em C++ com Programação Orientada a Objetos, interfaces abstratas, baixo acoplamento e persistência em arquivos.

---

## 📋 Visão Geral do Projeto e Contexto de Engenharia

O **Módulo de Compras ERP** é uma aplicação industrial robusta em C++ puro que simula com alto grau de fidelidade a cadeia de suprimentos e o departamento de compras de uma empresa corporativa.

O sistema integra:
* Gerenciamento de fornecedores e ordens de compra.
* Controle e verificação de itens em estoque.
* Processamento de ordens de material provenientes da produção.
* Módulo financeiro integrado para contas a pagar e liberação de saldo.
* Sistema persistente de dados em arquivos de texto.

Este projeto foca profundamente na aplicação de **boas práticas de engenharia de software**, demonstrando conceitos avançados de estruturação de código, modularidade e padrões de projeto essenciais para aplicações corporativas escaláveis.

---

## 🏗️ Padrões de Projeto e Práticas Arquiteturais

### 1. Padrão de Projeto *Façade* (Fachada)
A classe central `ModuloCompras` atua como uma interface unificada simplificada frente ao conjunto complexo de subsistemas internos. O cliente (ex: o menu principal em `main.cpp`) interage apenas com a fachada, ocultando a complexidade das interações entre estoque, financeiro, fornecedores e ordens de compra.

### 2. Abstração e Interfaces de Baixo Acoplamento
Para garantir que o módulo de compras possa se comunicar com outros departamentos sem dependências rígidas, utilizamos interfaces abstratas puras (`IEstoque`, `IFinanceiro`, `IProducao`). Isso permite o princípio da responsabilidade única e substituição imediata de implementações (como trocar mocks por integrações reais de banco de dados SQL futuros) sem reescrever a lógica de compras.

* **Baixo Acoplamento:** As alterações feitas no comportamento interno do estoque ou financeiro não se propagam e não quebram o código do módulo de compras.

### 3. Encapsulamento e Polimorfismo
Uso estruturado de classes bases abstratas (`Pessoa`) com métodos virtuais puros, herança para `Fornecedor`, e tratamento estrito de exceções customizadas (`ComprasException`) para validações de regras de negócios.

---

## 🛠️ Tecnologias e Recursos de Linguagem

| Recurso | Papel no Projeto | Justificativa Técnica |
|---|---|---|
| **C++ Puro** | Core do Sistema | Escolhido para demonstrar gerenciamento estrito de recursos físicos, uso adequado de ponteiros, referências e performance nativa. |
| **Templates** | `ListaGenerica<T>` | Desenvolvimento de containers genéricos eficientes para coleções tipadas reutilizáveis. |
| **CMake** | Sistema de Build | Toolchain de compilação unificado multiplataforma para orquestrar arquivos `.h` e `.cpp`. |
| **Persistência** | `PersistenciaCompras` | Serialização e leitura estruturada de registros diretamente em arquivos de disco. |

---

## 📁 Estrutura do Projeto

```
Modulo de Compras Sistema ERP/
├── include/
│   ├── ModuloCompras.h          # Fachada principal do sistema (Façade)
│   ├── Fornecedor.h             # Entidade Fornecedor (herda Pessoa)
│   ├── OrdemCompra.h            # Entidade Ordem de Compra
│   ├── GerenciadorFornecedores.h
│   ├── GerenciadorOrdens.h
│   ├── PersistenciaCompras.h    # Interface de persistência em arquivos
│   ├── ListaGenerica.h          # Container genérico customizado (template)
│   ├── IEstoque.h               # Interface abstrata de Estoque
│   ├── IFinanceiro.h            # Interface abstrata Financeira
│   ├── IProducao.h              # Interface abstrata de Produção
│   ├── IExibivel.h              # Interface de exibição genérica
│   ├── EstoqueMock.h            # Implementação simulada (Mock) do Estoque
│   ├── FinanceiroMock.h         # Implementação simulada (Mock) do Financeiro
│   ├── ProducaoMock.h           # Implementação simulada (Mock) da Produção
│   ├── Pessoa.h                 # Classe base abstrata
│   └── ComprasException.h       # Classe de exceções de negócio customizada
│
└── src/
    ├── main.cpp                 # Interface de linha de comando e menu
    ├── ModuloCompras.cpp        # Lógica de negócio integrada da Fachada
    ├── GerenciadorFornecedores.cpp
    ├── GerenciadorOrdens.cpp
    └── PersistenciaCompras.cpp  # Implementação de leitura/escrita em arquivo
```

---

## 🚀 Como Compilar e Executar

### 1. Compilação Rápida (Windows)
Foi adicionado o script `compilar.bat` para facilitar a build com MinGW (`g++`):
```bat
./compilar.bat
```
*Ele irá gerar automaticamente o executável em `build/Modulo_Compras_ERP.exe` e perguntar se deseja executá-lo.*

### 2. Interface Web Premium (Nova Funcionalidade)
O módulo agora possui uma **Interface Gráfica Web** desenvolvida em HTML/CSS/JS puro (`index.html`) que serve como um simulador interativo de todas as funcionalidades de ERP (Fornecedores, Estoque, Ordens, Produção e Financeiro).
Para acessar, basta abrir o arquivo `index.html` no seu navegador de preferência.

### 3. Compilação Clássica (CMake)
```bash
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
./Modulo_Compras_ERP.exe
```
