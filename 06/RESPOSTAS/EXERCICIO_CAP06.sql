-- Gerar uma nova tabela convertendo todas as variáveis categóricas para representação numérica.A partir da variável pais_cliente você deve criar 3 novas colunas dummy.

SELECT * FROM cap06.vendas_loja_online
LIMIT 10;

SELECT DISTINCT pais_cliente FROM cap06.vendas_loja_online;

CREATE TABLE cap06.vendas_loja_online_resultado 
AS 
SELECT *,
	CASE 
	WHEN pais_cliente = 'Brasil' THEN 1
	ELSE 0
END AS pais_Brasil, 
	CASE 
	WHEN pais_cliente = 'Canadá' THEN 1
	ELSE 0
END AS pais_Canada,
	CASE 
	WHEN pais_cliente = 'Inglaterra' THEN 1
	ELSE 0
END AS pais_Inglaterra
FROM cap06.vendas_loja_online;

SELECT * FROM cap06.vendas_loja_online_resultado;