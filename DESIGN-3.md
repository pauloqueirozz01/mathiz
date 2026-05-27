---
name: Mathiz
colors:
  surface: '#f7fafc'
  surface-dim: '#d7dadc'
  surface-bright: '#f7fafc'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f1f4f6'
  surface-container: '#ebeef0'
  surface-container-high: '#e5e9eb'
  surface-container-highest: '#e0e3e5'
  on-surface: '#181c1e'
  on-surface-variant: '#43474e'
  inverse-surface: '#2d3133'
  inverse-on-surface: '#eef1f3'
  outline: '#74777f'
  outline-variant: '#c4c6cf'
  surface-tint: '#455f88'
  primary: '#002045'
  on-primary: '#ffffff'
  primary-container: '#1a365d'
  on-primary-container: '#86a0cd'
  inverse-primary: '#adc7f7'
  secondary: '#555f71'
  on-secondary: '#ffffff'
  secondary-container: '#d6e0f6'
  on-secondary-container: '#596376'
  tertiary: '#002625'
  on-tertiary: '#ffffff'
  tertiary-container: '#003d3c'
  on-tertiary-container: '#4cadab'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d6e3ff'
  primary-fixed-dim: '#adc7f7'
  on-primary-fixed: '#001b3c'
  on-primary-fixed-variant: '#2d476f'
  secondary-fixed: '#d9e3f9'
  secondary-fixed-dim: '#bdc7dc'
  on-secondary-fixed: '#121c2c'
  on-secondary-fixed-variant: '#3d4759'
  tertiary-fixed: '#94f2f0'
  tertiary-fixed-dim: '#77d6d3'
  on-tertiary-fixed: '#00201f'
  on-tertiary-fixed-variant: '#00504e'
  background: '#f7fafc'
  on-background: '#181c1e'
  surface-variant: '#e0e3e5'
typography:
  headline-xl:
    fontFamily: Hanken Grotesk
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Hanken Grotesk
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Hanken Grotesk
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
  formula-display:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '500'
    lineHeight: 32px
  code-label:
    fontFamily: JetBrains Mono
    fontSize: 13px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  base: 8px
  container-max: 1200px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 48px
---

## Brand & Style
O sistema de design é fundamentado no **Minimalismo Acadêmico**. O objetivo é criar um ambiente de hiperfoco, eliminando distrações visuais para priorizar a clareza cognitiva necessária para o estudo de Lógica Matemática e Matemática Aplicada.

A personalidade da interface é intelectual, precisa e confiável. O design evita ornamentos desnecessários, utilizando o espaço em branco (whitespace) como uma ferramenta estrutural para separar conceitos complexos. A estética evoca a sofisticação de uma publicação científica moderna, equilibrando a autoridade acadêmica com a agilidade de uma ferramenta digital de ponta.

## Colors
A paleta é centrada em tons de azul profundo e cinzas técnicos para transmitir estabilidade e seriedade.

*   **Primary (Deep Blue):** Utilizado para branding, cabeçalhos principais e ações primárias. Representa a profundidade do conhecimento.
*   **Secondary (Slate):** Cor de suporte para textos secundários e elementos de interface menos críticos.
*   **Tertiary (Teal):** Um sutil acento cromático usado exclusivamente para "pontos de foco", como resultados corretos em fórmulas ou indicadores de progresso.
*   **Neutral (Cool Gray/White):** Fundos limpos que garantem alto contraste para a leitura de símbolos matemáticos.

## Typography
A tipografia é o pilar central deste sistema de design. 

1.  **Hanken Grotesk** é utilizada para títulos, oferecendo uma geometria moderna e limpa que comunica precisão.
2.  **Inter** é a escolha para o corpo do texto e fórmulas matemáticas básicas, devido à sua legibilidade excepcional em telas e neutralidade absoluta.
3.  **JetBrains Mono** é reservada para rótulos técnicos, índices de matrizes e notações lógicas, reforçando o aspecto sistemático e computacional da matemática aplicada.

As fórmulas devem manter um espaçamento entre linhas (line-height) generoso para evitar a sobreposição de subscritos e sobrescritos.

## Layout & Spacing
O sistema utiliza uma **Grid Fluida de 12 colunas** para desktop e uma estrutura de coluna única com margens seguras para mobile. 

A hierarquia espacial é definida por uma escala de base 8px. O layout prioriza o alinhamento axial rigoroso, refletindo a ordem lógica da matemática. Áreas de trabalho (canvas para matrizes ou tabelas verdade) devem ocupar a largura total do container central para permitir a visualização de dados densos sem truncamento. 

Em dispositivos móveis, elementos complexos como tabelas devem permitir scroll horizontal suave com indicadores visuais de continuidade.

## Elevation & Depth
Para manter o rigor minimalista, o sistema evita sombras pesadas. A profundidade é comunicada através de **Camadas Tonais** e **Contornos de Baixo Contraste**.

*   **Superfícies:** O fundo principal é `Neutral-50`. Containers de conteúdo (cards) utilizam branco puro com uma borda fina de 1px em cinza claro.
*   **Interatividade:** Ao interagir com elementos (hover), utiliza-se uma sutil elevação através de uma sombra ambiente quase imperceptível (blur 4px, 5% de opacidade) para indicar clicabilidade sem quebrar a estética plana.
*   **Foco:** Elementos ativos ou campos de entrada selecionados recebem uma borda de 2px na cor `Tertiary (Teal)`.

## Shapes
As formas são predominantemente **Soft (Suaves)**, com um raio de curvatura de `0.25rem` (4px). Esta escolha suaviza a rigidez matemática sem tornar a interface excessivamente lúdica ou infantil. 

Botões e campos de entrada seguem este padrão de 4px, enquanto elementos menores como "check-chips" de seleção de variáveis podem utilizar o estilo `rounded-lg` (8px) para diferenciação tátil.

## Components
Os componentes são desenhados para funcionalidade máxima:

*   **Cards de Menu:** Superfícies brancas com bordas finas. Devem conter ícones geométricos minimalistas e títulos em `Hanken Grotesk`.
*   **Campos de Matriz:** Inputs compactos, centralizados horizontalmente, organizados em uma grid rigorosa. O foco deve ser automático ao preencher um valor (tab-flow).
*   **Tabelas Verdade:** Cabeçalhos em `Secondary Color` com texto em `JetBrains Mono`. As células devem ter preenchimento (padding) uniforme e listras (zebra-striping) muito sutis em cinza para facilitar a leitura horizontal de valores lógicos (V/F).
*   **Botões de Ação:** Estilo sólido para a ação principal (ex: "Calcular") e estilo "Ghost" (apenas borda) para ações secundárias (ex: "Limpar").
*   **Indicadores de Estado:** Pequenos badges em Teal para "Sucesso/Provado" e Indigo para "Processando/Teorema".