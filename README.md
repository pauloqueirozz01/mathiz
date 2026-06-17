# Mathiz — Matemática & Lógica

Aplicação mobile desenvolvida em Flutter para auxiliar estudantes em disciplinas de Matemática Aplicada e Lógica Matemática.

O projeto oferece ferramentas acadêmicas voltadas para resolução de problemas, visualização de conceitos matemáticos e registro de atividades realizadas pelo usuário.

---

# Funcionalidades

## Operações com Matrizes

O módulo de matrizes permite:

* Soma de matrizes
* Subtração de matrizes
* Multiplicação de matrizes
* Matrizes de 1x1 até 3x3
* Validação automática das operações
* Visualização do resultado em tempo real
* Registro automático no histórico

---

## Tabela-Verdade

O módulo de lógica proposicional permite:

* Construção de proposições lógicas
* Geração automática de tabelas-verdade
* Classificação de expressões em:

  * Tautologia
  * Contradição
  * Contingência
* Suporte a operadores:

  * ¬ (Negação)
  * ∧ (Conjunção)
  * ∨ (Disjunção)
  * → (Implicação)
  * ↔ (Bicondicional)
* Avaliação recursiva de expressões compostas
* Persistência automática no histórico

Exemplos válidos:

```text
P ∧ Q

¬P

(P ∧ Q) → R

(P ↔ Q)

(P ∨ Q) ∧ ¬R
```

---

## Histórico de Atividades

Todas as operações executadas são armazenadas localmente.

O histórico registra:

* tipo da operação;
* categoria;
* resultado;
* data de execução;
* metadados necessários para futura expansão.

---

# Tecnologias Utilizadas

* Flutter
* Dart
* Material Design
* Hive (Persistência Local)
* Arquitetura Modular
* Design System Próprio

---

# Arquitetura

O projeto segue uma organização modular baseada em separação de responsabilidades.

```text
lib/

├── core/
│   ├── constants/
│   ├── navigation/
│   ├── theme/
│
├── models/
│
├── services/
│
├── screens/
│   ├── home/
│   ├── matrix/
│   ├── logic/
│   ├── history/
│
├── widgets/
│
└── main.dart
```

---

# Principais Serviços

## MatrixService

Responsável pelas regras matemáticas de matrizes:

* soma;
* subtração;
* multiplicação;
* validações dimensionais.

---

## TruthTableService

Responsável pela geração das combinações lógicas para construção da tabela-verdade.

---

## LogicParserService

Responsável por:

* extração de variáveis;
* validação de expressões;
* análise sintática inicial.

---

## LogicEvaluatorService

Responsável por interpretar e avaliar expressões lógicas recursivamente.

Suporta:

```text
¬
∧
∨
→
↔
()
```

---

## HistoryService

Camada responsável por persistir e recuperar atividades do usuário.

---

# Design System

O projeto utiliza um Design System próprio baseado em:

* AppColors
* AppTextStyles
* AppSpacing
* AppSizes

Objetivos:

* eliminar magic numbers;
* manter consistência visual;
* facilitar manutenção;
* acelerar criação de novas telas.

---

# Como Executar o Projeto

## Pré-requisitos

Instalar:

* Flutter SDK
* Dart SDK
* Android Studio ou VS Code
* Xcode (macOS para iOS)

Verifique a instalação:

```bash
flutter doctor
```

---

## Clonar o Projeto

```bash
git clone https://github.com/SEU-USUARIO/mathiz.git

cd mathiz
```

---

## Instalar Dependências

```bash
flutter pub get
```

---

## Executar

```bash
flutter run
```

---

## Gerar Build Android

```bash
flutter build apk
```

---

## Gerar Build iOS

```bash
flutter build ios
```

---

# Roadmap

Próximas evoluções planejadas:

* Determinante
* Matriz Inversa
* Transposta
* Sistema Linear
* Exportação de histórico
* Favoritos
* Tema escuro
* Mais operadores lógicos
* Simplificação de expressões

---

# Objetivos Acadêmicos

* Aplicar conceitos matemáticos em software real;
* Desenvolver raciocínio lógico;
* Explorar arquitetura Flutter;
* Aprender componentização;
* Trabalhar persistência local;
* Construir aplicações escaláveis.

---

# Equipe

* André Lins
* Ícaro Araújo
* Micael Studart
* Paulo Queiroz
* Ronaldo Filho

Curso de Sistemas de Informação — UNI7

---

# Licença

Projeto acadêmico desenvolvido para fins educacionais.
