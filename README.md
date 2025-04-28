# Determinantes e Efeitos do Markup nas Indústrias de Carne Bovina no Brasil (2010-2022)

O objetivo deste projeto é analisar como o poder de mercado dos frigoríficos influencia o comportamento dos markups em momentos de choque de oferta no Brasil. O estudo investiga a hipótese de que as indústrias de carne bovina alteram suas margens de lucro durante períodos de volatilidade nos preços do boi gordo, utilizando métodos econométricos de séries temporais.

## Objetivo

Analisar a adaptação do markup dos três maiores frigoríficos do Brasil (JBS, Marfrig e Minerva Foods) em resposta a choques de oferta no mercado de carne bovina, no período de 2010 a 2022, utilizando o modelo de Vetor de Correção de Erro (VECM).

## Tecnologias e Ambiente de Desenvolvimento

- **Linguagens:** R
- **Pacotes R:** `vars`, `tseries`, `lmtest`, `ggplot2`, `readxl`, `urca`, `car`
- **Ferramentas Estatísticas:** Teste ADF, Cointegração de Johansen, VECM
- **Ambiente de Desenvolvimento:** RStudio

## Estrutura

- **dados/**: Conjunto de dados de variação de preços de carne e boi gordo, lucros e custos dos frigoríficos (arquivo `.xlsx`)
- **scripts/**: Código em R para ajuste dos modelos econométricos e geração dos resultados (`r vecm.R`)
- **monografia/**: Documento acadêmico com todo o desenvolvimento teórico, metodológico e discussão de resultados (`Monografia Bruna Derner FINAL.docx`)

## Arquivos do Projeto

- Código de análise econométrica em R (`r vecm.R`)
- Conjunto de dados tratados (`conjunto de dados mono.xlsx`)
- Documento acadêmico completo (`Monografia Bruna Derner FINAL.docx`)

## Ficha Técnica

### Metodologia

- **Análise Econométrica:**
  - Teste de estacionariedade ADF.
  - Seleção do número ótimo de defasagens (AIC e SBC).
  - Teste de cointegração de Johansen.
  - Estimação do modelo VECM (Vetor de Correção de Erro).
  - Decomposição da variância dos markups.
  - Análise de Função de Impulso Resposta (IRF).

- **Variáveis:**
  - Markup das empresas (JBS, Marfrig, Minerva).
  - Variação de preços dos cortes de carne bovina.
  - Preço do boi gordo.
  - Dummy de choque de oferta.

- **Fonte dos Dados:**
  - IBGE - SIDRA
  - CEPEA/ESALQ-USP
  - Relatórios financeiros das empresas (RI)

### Principais Resultados

- **Cointegração encontrada:** Entre os markups e variáveis de mercado.
- **Impacto dos choques de oferta:** A dummy de choque de oferta não se mostrou estatisticamente significativa, refutando a hipótese inicial.
- **Determinantes dos markups:** 
  - O preço do boi gordo impacta significativamente o markup da Minerva.
  - As dinâmicas entre concorrentes (especialmente entre JBS e Marfrig) influenciam as margens.

- **Conclusão:** A adaptação dos markups é mais complexa e não responde diretamente aos choques de oferta isoladamente, dependendo também da competição entre empresas e de variáveis de mercado.

---

## Autora

**Bruna Derner Alvares**  
Bacharel em Ciências Econômicas - Universidade Federal do Mato Grosso (UFMT)

