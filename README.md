# Mathiz — Educação & Lógica

Aplicação mobile desenvolvida em Flutter com foco acadêmico para auxiliar estudantes nas disciplinas de **Matemática Aplicada** e **Lógica Matemática**, componentes curriculares do curso de **Sistemas de Informação | UNI7**.

O projeto busca unir:

- organização arquitetural;
- experiência visual moderna;
- componentização;
- reaproveitamento de código;
- performance;
- e aprendizado prático de desenvolvimento mobile.

---

# Objetivo do Projeto

O **Mathiz** foi criado como um ambiente de apoio acadêmico voltado para:

- resolução de cálculos;
- estudos de lógica;
- organização matemática;
- experimentação visual;
- e reforço dos conceitos aprendidos em sala de aula.

Além da proposta educacional, o projeto também serve como laboratório prático de:

- Flutter;
- Dart;
- arquitetura frontend;
- design system;
- componentização;
- e organização de aplicações escaláveis.

---

# Tecnologias Utilizadas

- Flutter
- Dart
- Material Design 3
- Local Storage
- Design System próprio
- Arquitetura Modular

---

# Estrutura Arquitetural

O projeto utiliza uma abordagem modular para manter:

- escalabilidade;
- separação de responsabilidades;
- manutenção simplificada;
- e maior reaproveitamento de código.

## Estrutura Base

```text
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── widgets/
│
├── screens/
│   ├── splash/
│   ├── home/
│   ├── calculator/
│
├── services/
├── models/
├── repositories/
│
├── main.dart
```

## Arquitetura Modular

A arquitetura modular foi adotada para evitar:

- acoplamento excessivo;
- código duplicado;
- arquivos gigantes;
- responsabilidades misturadas.
  Cada módulo possui responsabilidade própria, facilitando:
- testes;
- manutenção;
- escalabilidade;
- reutilização de componentes.

## Design System

O projeto utiliza um Design System próprio para padronização visual da aplicação.

Isso inclui:

- paleta de cores;
- escala tipográfica;
- espaçamentos;
- pesos de fonte;
- componentes reutilizáveis;
- estilos globais.

## Benefícios

- consistência visual;
- manutenção simplificada;
- código mais limpo;
- redução de “magic numbers”;
- facilidade de evolução visual do app.

## Componentização

Todo elemento reutilizável da interface será transformado em componente.

Exemplos:

- botões;
- campos de input;
- loaders;
- cards;
- barras de progresso;
- títulos;
- widgets matemáticos.

Isso reduz:

- repetição;
- inconsistência visual;
- complexidade do código.

## Persistência de Dados

O aplicativo utilizará banco de dados local para armazenar:

- cálculos realizados;
- histórico do usuário;
- operações recentes;
- preferências da aplicação.

Os dados ficarão armazenados localmente no dispositivo do usuário, permitindo:

- acesso rápido;
- funcionamento offline;
- melhor experiência de uso.

## Objetivos Técnicos

O projeto também tem como foco aprofundar conhecimentos em:

- Flutter Architecture
- Clean Code
- UI/UX
- Navegação entre telas
- Gerenciamento de estado
- Persistência local
- Componentização
- Escalabilidade frontend
- Estruturação de Design Systems

## Objetivos Acadêmicos

- Aplicar conceitos matemáticos em aplicações reais;
- Criar ferramentas de apoio educacional;
- Relacionar lógica computacional e lógica matemática;
- Desenvolver soluções voltadas ao ambiente universitário.

## Status do Projeto

🚧 Em desenvolvimento
Atualmente sendo desenvolvidos:

- Splash Screen
- Estrutura arquitetural
- Design System
- Navegação inicial
  -Componentes reutilizáveis

## Autor

André Lins
Ícaro Araujo
Micael Studart
Paulo Queiroz
Ronaldo

Alunos do Curso de Sistemas de Informação — UNI7

## Licença

Projeto acadêmico desenvolvido para fins educacionais.
