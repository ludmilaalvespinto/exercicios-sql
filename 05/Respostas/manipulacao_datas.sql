SELECT * FROM cap05.dsa_vendas;

-- Query SQL para retornar o valor total final de vendas por dia.
SELECT
	data_venda,
	SUM(valor_unitario_venda * unidades_vendidas) AS valor_total_final_venda
FROM cap05.dsa_vendas
GROUP BY data_venda
ORDER BY data_venda;

-- Query SQL para retornar a média de vendas por mês
SELECT
	EXTRACT(YEAR FROM data_venda) AS ano,
	EXTRACT(MONTH FROM data_venda) as mes, 
	ROUND(AVG(valor_unitario_venda * unidades_vendidas),2) AS media_valor_final_venda
FROM cap05.dsa_vendas
GROUP BY EXTRACT(YEAR FROM data_venda), EXTRACT(MONTH FROM data_venda)
ORDER BY ano, mes;

-- Pode fazer assim também:
SELECT
	EXTRACT(YEAR FROM data_venda) AS ano,
	EXTRACT(MONTH FROM data_venda) as mes, 
	ROUND(AVG(valor_unitario_venda * unidades_vendidas),2) AS media_valor_final_venda
FROM cap05.dsa_vendas
GROUP BY ano,mes
ORDER BY ano, mes;

--Query SQL para retornar do valor total final de venda no dia 01 de cada mês.

SELECT
	EXTRACT(YEAR FROM data_venda) AS ano,
	EXTRACT(MONTH FROM data_venda) as mes, 
	ROUND(AVG(valor_unitario_venda * unidades_vendidas),2) AS media_valor_final_venda
FROM cap05.dsa_vendas
WHERE EXTRACT(DAY FROM data_venda)=1
GROUP BY ano,mes
ORDER BY ano, mes;

-- Query SQL para retornar do valor total final de venda entre os dias 10 e 20 de cada mês


SELECT
	EXTRACT(YEAR FROM data_venda) AS ano,
	EXTRACT(MONTH FROM data_venda) as mes, 
	ROUND(AVG(valor_unitario_venda * unidades_vendidas),2) AS media_valor_final_venda
FROM cap05.dsa_vendas
WHERE EXTRACT(DAY FROM data_venda) BETWEEN 10 AND 20
GROUP BY ano,mes
ORDER BY ano, mes;
