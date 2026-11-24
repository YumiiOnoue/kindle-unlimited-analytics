# Documentação das Métricas e KPIs utilizados

O objetivo do projeto é verificar se o Kindle+ compensa financeiramente para mim, considerando quanto pago, quantos livros concluo e o valor de referência desses livros, e como posso aproveitar melhor a assinatura para decidir se devo mantê-la.

**Para isso foram selecionadas os seguintes KPIs** 

| KPI	| Fórmula | Dados necessários | 
| :---: | :---: | :---: |
| Custo mensal da assinatura | Valor pago no mês | Data de referência e valor da assinatura |
| Livros Kindle+ concluídos | Contagem de livros elegíveis concluídos no mês | Origem, status, data de conclusão e identificador do livro |
| Custo por livro concluído	| Custo mensal ÷ livros concluídos | Custo mensal e quantidade de livros |
| Valor de referência digital | Soma dos preços digitais conhecidos | Preço digital dos livros concluídos |
| Valor de referência físico | Soma dos preços físicos conhecidos | Preço físico dos livros concluídos |
| Relação valor/custo | Valor de referência ÷ custo da assinatura | Valor de referência e custo mensal |

### Regras:
- Se não houver livros concluídos no mês, o custo por livro será N/A, não zero.
- Preços ausentes não devem ser tratados automaticamente como zero.
- A contagem de livros precisa respeitar a granularidade real da tabela, evitando duplicidades.
- Valores de referência não devem ser apresentados como economia efetiva.
- Os indicadores financeiros devem considerar os meses em que a assinatura esteve ativa, inclusive os meses sem livros concluídos.