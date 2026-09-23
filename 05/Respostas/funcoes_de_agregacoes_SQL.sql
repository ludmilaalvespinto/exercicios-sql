SELECT * FROM cap05.dsa_vendas;

-- Query SQL para retornar a média de Valor_Unitario_Venda;
SELECT ROUND (AVG(valor_unitario_venda),2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas;

-- Query SQL para retornar a contagem, valor mínimo, valor máximo e soma (total) de Valor_Unitario_Venda
SELECT
    COUNT(valor_unitario_venda) AS contagem,
    MIN(valor_unitario_venda) AS valor_minimo,
    MAX(valor_unitario_venda) AS valor_maximo,
    SUM(valor_unitario_venda) AS soma_total
FROM cap05.dsa_vendas;

-- Query SQL para retornar a média (com duas casas decimais) de valor_unitario_venda por categoria de produto
SELECT
	categoria_produto,
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM cap05.dsa_vendas
GROUP BY categoria_produto
ORDER BY media_valor_unitario DESC;

--Query SQL para retornar a soma de valor_unitario_venda por produto
SElECT 
	nome_produto,
	SUM(valor_unitario_venda) AS soma_valor_unitario
FROM cap05.dsa_vendas
GROUP BY nome_produto
ORDER BY soma_valor_unitario DESC;

-- Query SQL para retornar a soma de valor_unitario_venda por produto e categoria
SELECT
	nome_produto,
	categoria_produto,
	SUM(valor_unitario_venda) AS soma_valor_unitario
FROM cap05.dsa_vendas
GROUP BY nome_produto,categoria_produto
ORDER BY nome_produto,categoria_produto;

SELECT
	categoria_produto,
	nome_produto,
	SUM(valor_unitario_venda) AS soma_valor_unitario
FROM cap05.dsa_vendas
GROUP BY categoria_produto, nome_produto
ORDER BY nome_produto,categoria_produto;

--Query SQL para retornar a média (com duas casas decimais) de valor_unitario_venda por produto, 
-- somente se a média for maior ou igual a 16

SELECT 
	nome_produto,
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM cap05.dsa_vendas
GROUP BY nome_produto
HAVING AVG(valor_unitario_venda) >=16

-- o "HAVING" é uma condição que permite fazer condições, a cláusula WHERE é feito antes de realizar a média, então não dá certo.

-- Query SQL para retornar a média (com duas casas decimais) de valor_unitario_venda por produto e categoria, 
-- somente se a média for maior ou igual a 16 e unidades vendidas maior do que 4, ordenado por nome de produto.

SELECT
	nome_produto,
	categoria_produto,
	ROUND(AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM cap05.dsa_vendas
WHERE unidades_vendidas > 4
GROUP BY categoria_produto,nome_produto
HAVING AVG(valor_unitario_venda) >=16
ORDER BY nome_produto;
	

-- Query SQL para retornar a média (com duas casas decimais) de valor_unitario_venda por produto e categoria, 
-- somente se a média for maior ou igual a 16 e o produtor por B ou C,ordenado por categoria.

SELECT 
	nome_produto, 
	categoria_produto,
	ROUND (AVG(valor_unitario_venda),2) AS media_valor_unitario
FROM cap05.dsa_vendas
WHERE nome_produto IN ('Produto B', 'Produto C')
GROUP BY nome_produto, categoria_produto
HAVING AVG(valor_unitario_venda) >=16
ORDER BY categoria_produto;






