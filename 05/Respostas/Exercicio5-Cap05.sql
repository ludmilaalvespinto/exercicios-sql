SELECT * FROM cap05.clientes


-- Pergunta 1: Quantos clientes estão registrados por estado?
SELECT 
	estado,
	COUNT (nome) AS contagem_de_clientes
FROM cap05.clientes
GROUP BY estado
ORDER  BY estado;


-- Pergunta 2: Qual é a idade média dos clientes?
-- Para descobrir a idade:
SELECT 
    data_nascimento,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, data_nascimento)) AS idade
FROM cap05.clientes;

-- Agora a média:
SELECT 
    ROUND(AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, data_nascimento)))) AS media_idade
FROM cap05.clientes;

-- Pergunta 3: Quantos clientes têm mais de 30 anos?
SELECT 
	COUNT (*) AS quantidade_clientes
FROM cap05.clientes
	WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE,data_nascimento)) >30
	

-- Pergunta 4: Quais são as 3 cidades com o maior número de clientes?
SELECT 
	cidade, 
	COUNT(*) AS quantidade_clientes
FROM cap05.clientes
GROUP BY cidade
ORDER BY quantidade_clientes DESC
LIMIT 3;
	

-- Pergunta 5: Quantos clientes têm um endereço de e-mail registrado?
SELECT 
    COUNT(*) AS clientes_com_email
FROM cap05.clientes
WHERE email IS NOT NULL
  AND TRIM(email) <> '';