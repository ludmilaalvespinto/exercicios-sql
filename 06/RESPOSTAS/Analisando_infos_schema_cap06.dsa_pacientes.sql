SELECT * FROM cap06.dsa_pacientes;

-- Valores distintos
SELECT DISTINCT classe FROM cap06.dsa_pacientes;

-- Binarização da variável classe (0/1)
SELECT classe,
    CASE 
    WHEN classe = 'sem-recorrencia-eventos' THEN 0 
    WHEN classe = 'com-recorrencia-eventos' THEN 1
  END AS classe_transformada
FROM cap06.dsa_pacientes;

-- Binarização da variável irradiando (0/1)
SELECT irradiando,
    CASE 
    WHEN irradiando = 'não' THEN 0 
    WHEN irradiando = 'sim' THEN 1
  END AS irradiando_transformada
FROM cap06.dsa_pacientes;

-- Binarização da variável node_caps (0/1)
SELECT irradiando,
    CASE 
    WHEN irradiando = 'não' THEN 0 
    WHEN irradiando = 'sim' THEN 1
  END AS irradiando_transformada
FROM cap06.dsa_pacientes;