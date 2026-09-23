-- Subqueries (ou sub-consultas) sçao usadas em SQL quando uma consulta é aninhada dentro de outra consulta.
-- Elas podem ser muito úteis em vários cenários, como:

-- Para obter valores para filtrar;
-- Operações de agregação em filtragem;
-- Existência de registros;
-- Seleção de colunas.

SELECT * FROM cap05.dsa_vendas;

-- query SQL para retornar a média de valor_unitario_venda por produto,
-- somente se a média for maior do que 5 e categoria de produto for 1 ou 2.

-- modo sem subquerie:
SELECT
	nome_produto,
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM cap05.dsa_vendas
WHERE categoria_produto IN ('Categoria 1', 'Categoria 2')
GROUP BY nome_produto
HAVING AVG(valor_unitario_venda) >5;

-- com subquerie:
SELECT
	nome_produto,
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM (
	SELECT nome_produto, valor_unitario_venda
	FROM cap05.dsa_vendas
	WHERE categoria_produto IN ('Categoria 1', 'Categoria 2')
) AS sub_query
GROUP BY nome_produto
HAVING AVG(valor_unitario_venda) >5;

--Query SQL que retorne somente registros cuja média de unidades vendidas seja maior do que 2.
-- Desse resultado, retorne os produtos cuja média de vendas foi maior do que 15.

SELECT
	nome_produto, 
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM(
	SELECT nome_produto, valor_unitario_venda
	FROM cap05.dsa_vendas
	GROUP BY nome_produto, valor_unitario_venda
	HAVING AVG(unidades_vendidas)> 2
) AS sub_query
GROUP BY nome_produto
HAVING AVG(valor_unitario_venda)>15;


-- Somente registros se a categoria de produtor for 1 ou 2.
SELECT
	nome_produto, 
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM(
	SELECT nome_produto, valor_unitario_venda
	FROM cap05.dsa_vendas
	WHERE categoria_produto IN ('Categoria 1', 'Categoria 2')
	GROUP BY nome_produto, valor_unitario_venda
	HAVING AVG(unidades_vendidas)> 2
) AS sub_query
GROUP BY nome_produto
HAVING AVG(valor_unitario_venda)>15;