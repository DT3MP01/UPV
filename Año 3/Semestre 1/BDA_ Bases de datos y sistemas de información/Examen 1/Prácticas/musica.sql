-- 8: Obtener el nombre de los artistas que pertenezcan a un grupo de Espa�a.

SELECT DISTINCT A.nombre -- ya que no es CP
FROM ARTISTA A, PERTENECE P, GRUPO G
WHERE A.dni = P.dni
    AND P.cod = G.cod
    AND G.pais = 'Espa�a'
ORDER BY A.nombre;


----- CUANTIFICACI�N UNIVERSAL

-- 17: Obtener el nombre de las compa��as discogr�ficas que no han trabajado 
-- con grupos espa�oles.

SELECT nombre
FROM COMPANYIA C
WHERE NOT EXISTS
    (SELECT *
    FROM GRUPO G, DISCO D
    WHERE D.cod_comp = C.cod
    AND D.cod_gru = G.cod
AND G.pais = 'Espa�a');
-- AND EXISTS 
    -- (SELECT *
    -- FROM GRUPO G, DISCO D
    -- WHERE D.cod_comp = C.cod
    -- AND D.cod_gru = G.cod);

-- 18: Obtener el nombre de las compa��as discogr�ficas que solo han trabajado 
-- con grupos espa�oles.

