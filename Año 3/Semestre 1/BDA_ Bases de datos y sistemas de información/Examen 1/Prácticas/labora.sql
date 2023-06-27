-- 3.1: Consultas sobre una tabla 

-- Ejercicio 1: Obtener ordenados ascendentemente los c�digos de los pa�ses de donde son los actores.

SELECT DISTINCT cod_pais
FROM ACTOR
ORDER BY cod_pais;

-- Ejercicio 2: Obtener el c�digo y el t�tulo de las pel�culas de a�o anterior a 1970 que no est�n basadas en ning�n libro ordenadas por t�tulo.

SELECT cod_peli, titulo
FROM PELICULA
WHERE anyo < 1970 AND cod_lib IS NULL
ORDER BY titulo;

-- Ejercicio 3: Obtener el c�digo y el nombre de los actores cuyo nombre incluye �John�.

SELECT cod_act, nombre
FROM ACTOR
WHERE nombre LIKE '%John%';

-- Ejercicio 4: Obtener el c�digo y el t�tulo de las pel�culas de m�s de 120 minutos de la d�cada de los 80.

SELECT cod_peli, titulo
FROM PELICULA
WHERE duracion > 120 AND anyo BETWEEN 1980 AND 1989;

-- Ejercicio 5: Obtener el c�digo y el t�tulo de las pel�culas que est�n basadas en alg�n libro y cuyo director se apellide �Pakula�.

SELECT cod_peli, titulo
FROM PELICULA
WHERE cod_lib IS NOT NULL AND director LIKE '%Pakula%'; -- LIKE -> Contiene

-- Ejercicio 6: �Cu�ntas pel�culas hay de m�s de 120 minutos de la d�cada de los 80?

SELECT COUNT(*)
FROM PELICULA
WHERE duracion > 120 AND anyo BETWEEN 1980 AND 1989;

-- Ejercicio 7: �Cu�ntas pel�culas se han clasificado de los g�neros de c�digo 'BB5' o 'GG4' o'JH6'?

SELECT COUNT(DISTINCT cod_peli) -- se utiliza DISTINCT si no son claves primarias
FROM CLASIFICACION
WHERE cod_gen IN ('BB5', 'GG4', 'JH6');

-- Ejercicio 8: �De qu� a�o es el libro m�s antiguo?

SELECT MIN(anyo)
FROM LIBRO_PELI;

-- Ejercicio 9: �Cu�l es la duraci�n media de las pel�culas del a�o 1987?

SELECT AVG(duracion)
FROM PELICULA
WHERE anyo = 1987;

-- Ejercicio 10: �Cu�ntos minutos ocupan todas las pel�culas dirigidas por 'Steven Spielberg'?

SELECT SUM(duracion)
FROM PELICULA
WHERE director = 'Steven Spielberg';

-- 3.2: Consultas sobre varias tablas

-- Ejercicio 11: Obtener el c�digo y el t�tulo de las pel�culas en las que act�a un actor con el mismo nombre que el director de la pel�cula (ordenadas por t�tulo).

SELECT P.cod_peli, titulo
FROM PELICULA P, ACTOR A, ACTUA AC
WHERE AC.cod_act = A.cod_act 
        AND AC.cod_peli = P.cod_peli
        AND nombre = director
ORDER BY titulo;

-- Ejercicio 12: Obtener el c�digo y el t�tulo de las pel�culas clasificadas del g�nero de nombre 'Comedia' (ordenadas por t�tulo).

SELECT P.cod_peli, titulo
FROM PELICULA P, CLASIFICACION C, GENERO G
WHERE C.cod_peli = P.cod_peli
        AND C.cod_gen = G.cod_gen
        AND G.nombre = 'Comedia'
ORDER BY titulo;

-- Ejercicio 13: Obtener el c�digo y el t�tulo de las pel�culas basadas en alg�n libro anterior a 1950.

SELECT P.cod_peli, P.titulo
FROM PELICULA P, LIBRO_PELI L
WHERE P.cod_lib = L.cod_lib AND L.anyo < 1950
ORDER BY P.titulo;

-- 14: Obtener el c�digo y el nombre de los pa�ses de los actores que act�an en pel�culas clasificadas del g�nero de nombre 'Comedia' (ordenados por nombre).

SELECT DISTINCT PA.cod_pais, PA.nombre
FROM PAIS PA, ACTOR A, ACTUA AC, PELICULA P, CLASIFICACION C, GENERO G
WHERE A.cod_pais = PA.cod_pais
        AND AC.cod_act = A.cod_act
        AND AC.cod_peli = P.cod_peli
        AND C.cod_peli = P.cod_peli
        AND C.cod_gen = G.cod_gen
        AND G.nombre = 'Comedia'
ORDER BY nombre;

-- Versi�n alternativa sin pasar por pel�cula
-- Es posible debido a que cod_peli de ACTUA y CLASIFICACION son claves
-- Ajenas a PEL�CULA

SELECT DISTINCT PA.cod_pais, PA.nombre
FROM PAIS PA, ACTOR A, ACTUA AC, CLASIFICACION C, GENERO G
WHERE A.cod_pais = PA.cod_pais
        AND AC.cod_act = A.cod_act
        AND AC.cod_peli = C.cod_peli
        AND C.cod_gen = G.cod_gen
        AND G.nombre = 'Comedia'
ORDER BY nombre;

-- Ejercicio 15: Resolver los ejercicios 11, 12, 13 y 14 con subconsultas. Las soluciones son exactamente las mismas.

-- Ejercicio 11 con Subconsultas: Obtener el c�digo y el t�tulo de las pel�culas en las que act�a un actor con el mismo nombre que el director de la pel�cula (ordenadas por t�tulo).

SELECT cod_peli, titulo
FROM PELICULA
WHERE cod_peli IN 
                    (SELECT cod_peli
                    FROM ACTUA
                    WHERE cod_act IN 
                        (SELECT cod_act
                        FROM ACTOR
                        WHERE nombre = director)
                    )
ORDER BY titulo;

-- Ejercicio 12 con Subconsultas: Obtener el c�digo y el t�tulo de las pel�culas clasificadas del g�nero de nombre 'Comedia' (ordenadas por t�tulo).

SELECT cod_peli, titulo
FROM PELICULA
WHERE cod_peli IN
                    (SELECT cod_peli
                    FROM CLASIFICACION
                    WHERE cod_gen IN
                                    (SELECT cod_gen 
                                    FROM GENERO
                                    WHERE nombre = 'Comedia')
                    )
ORDER BY titulo;

-- Ejercicio 13 con Subconsutlas: Obtener el c�digo y el t�tulo de las pel�culas
-- basadas en alg�n libro anterior a 1950.

SELECT cod_peli, titulo
FROM PELICULA
WHERE cod_lib IN
                (SELECT cod_lib
                FROM LIBRO_PELI
                WHERE anyo < 1950)
ORDER BY titulo;

-- Ejercicio 14 con Subconsultas: Obtener el c�digo y el nombre de los pa�ses de
-- los actores que act�an en pel�culas clasificadas del g�nero de nombre 'Comedia' (ordenados por nombre).

SELECT cod_pais, nombre
FROM PAIS
WHERE cod_pais IN
    (SELECT cod_pais
    FROM ACTOR
    WHERE cod_act IN
        (SELECT cod_act
        FROM ACTUA
        WHERE cod_peli IN
                (SELECT cod_peli
                FROM CLASIFICACION
                WHERE cod_gen IN
                    (SELECT cod_gen
                    FROM GENERO
                    WHERE nombre = 'Comedia')
                )
            )
        )
ORDER BY nombre;

-- Ejercicio 16: Obtener el c�digo y el nombre de los actores nacidos antes de
-- 1950 que act�an con un papel 'Principal' en alguna pel�cula (ordenados por nombre).

SELECT cod_act, nombre
FROM ACTOR
WHERE cod_act IN
                (SELECT cod_act
                FROM ACTUA
                WHERE papel = 'Principal'
                )
            AND (fecha_nac < '1/1/1950') 
ORDER BY nombre;

-- Ejercicio 17: Obtener el c�digo, el t�tulo y el autor de los libros en los
-- que se ha basado alguna pel�cula de la d�cada de los 90 (ordenados por t�tulo).

SELECT cod_lib, titulo, autor
FROM LIBRO_PELI
WHERE cod_lib IN 
    (SELECT cod_lib
    FROM PELICULA
    WHERE anyo BETWEEN 1990 AND 1999)
ORDER BY titulo;

-- Ejercicio 18: Obtener el c�digo, el t�tulo y el autor de los libros en los
-- que no se haya basado ninguna pel�cula.

SELECT cod_lib, titulo, autor
FROM LIBRO_PELI
WHERE cod_lib NOT IN -- Siempre con NOT IN hay que poner IS NOT NULL si no es CP
    (SELECT cod_lib
    FROM PELICULA
    WHERE cod_lib IS NOT NULL);
    
-- Ejercicio 19: Obtener el nombre del g�nero o g�neros a los que pertenecen
-- pel�culas en las que no act�a ning�n actor (ordenados por nombre).

SELECT nombre
FROM GENERO
WHERE cod_gen IN
                (SELECT cod_gen
                FROM CLASIFICACION
                WHERE cod_peli NOT IN
                                    (SELECT cod_peli
                                    FROM ACTUA)
                )
ORDER BY nombre;

-- Ejercicio 20: Obtener el t�tulo de los libros en los que se haya basado
-- alguna pel�cula en la que no hayan actuado actores del pa�s de nombre 'USA' 
-- (ordenados por t�tulo).

SELECT titulo
FROM LIBRO_PELI
WHERE cod_lib IN
    (SELECT cod_lib
    FROM PELICULA
    WHERE cod_peli NOT IN
        (SELECT cod_peli
        FROM ACTUA
        WHERE cod_act IN
            (SELECT cod_act
            FROM ACTOR
            WHERE cod_pais IN
                (SELECT cod_pais
                FROM PAIS
                WHERE nombre = 'USA')
            )
        )
    )
ORDER BY titulo;

-- Ejercicio 21: �Cu�ntas pel�culas hay clasificadas del g�nero de nombre
-- 'Comedia' y en las que solo aparece un actor con el papel 'Secundario'?

SELECT COUNT(*)
FROM PELICULA
WHERE cod_peli IN
    (SELECT cod_peli
    FROM CLASIFICACION
    WHERE cod_gen IN
        (SELECT cod_gen
        FROM GENERO
        WHERE nombre = 'Comedia')
    ) 
AND cod_peli IN
    (SELECT cod_peli
    FROM ACTUA
    WHERE papel = 'Secundario'
    );
    
-- Ejercicio 22: Obtener el a�o de la primera pel�cula en la que el actor de
-- nombre 'Jude Law' tuvo un papel como 'Principal'.

SELECT MIN(anyo)
FROM PELICULA
WHERE cod_peli IN 
    (SELECT cod_peli
    FROM ACTUA
    WHERE papel = 'Principal' AND cod_act IN
        (SELECT cod_act
        FROM ACTOR
        WHERE nombre = 'Jude Law')
    );
    
-- Ejercicio 23: Obtener el c�digo y el nombre de actor o actores m�s viejos.

SELECT cod_act, nombre
FROM ACTOR
WHERE fecha_nac =
    (SELECT MIN(fecha_nac) 
    FROM ACTOR);
    
-- Ejercicio 24: Obtener el c�digo, el nombre y la fecha de nacimiento del actor m�s viejo nacido en el a�o 1940.

SELECT cod_act, nombre, fecha_nac
FROM ACTOR
WHERE fecha_nac =
    (SELECT MIN(fecha_nac)
    FROM ACTOR
    WHERE EXTRACT (YEAR FROM fecha_nac) = 1940);
    
-- Ejercicio 25: Obtener el nombre del g�nero (o de los g�neros) en los que se ha
-- clasificado la pel�cula m�s larga.

SELECT nombre
FROM GENERO
WHERE cod_gen IN
    (SELECT cod_gen
    FROM CLASIFICACION
    WHERE cod_peli IN
        (SELECT cod_peli
        FROM PELICULA
        WHERE duracion =
            (SELECT MAX(duracion)
            FROM PELICULA)
        )
    )
ORDER BY nombre;

-- Ejercicio 26: Obtener el c�digo y el t�tulo de los libros en los que se han
-- basado pel�culas en las que act�an actores del pa�s de nombre Espa�a (ordenados por t�tulo).

SELECT cod_lib, titulo
FROM LIBRO_PELI
WHERE cod_lib IN
    (SELECT cod_lib
    FROM PELICULA
    WHERE cod_peli IN
        (SELECT cod_peli
        FROM ACTUA
        WHERE cod_act IN
            (SELECT cod_act
            FROM ACTOR
            WHERE cod_pais IN
                (SELECT cod_pais
                FROM PAIS
                WHERE nombre = 'Espa�a')
            )
        )
    )
ORDER BY titulo;

-- Ejercicio 27: Obtener el t�tulo de las pel�culas anteriores a 1950 
-- clasificadas en m�s de un g�nero (ordenadas por t�tulo).

SELECT titulo
FROM PELICULA P
WHERE anyo < 1950 AND
    (SELECT COUNT(*) -- ya que cod_gen es CP y no tendr� valores nulos, * cuenta valores nulos
    FROM CLASIFICACION C
    WHERE P.cod_peli = C.cod_peli) > 1
ORDER BY titulo;
    
-- Ejercicio 28: Obtener la cantidad de pel�culas en las que han participado 
-- (actuado) menos de 4 actores.

SELECT COUNT(*)
FROM PELICULA P
WHERE 
    (SELECT COUNT(*)
    FROM ACTUA AC
    WHERE P.cod_peli = AC.cod_peli) < 4;
        
-- Ejercicio 29: Obtener los directores que han dirigido m�s de 250 minutos 
-- entre todas sus pel�culas.

SELECT DISTINCT P.director -- ya que director no es clave primaria
FROM PELICULA P
WHERE
    (SELECT SUM(P2.duracion)
    FROM PELICULA P2
    WHERE P.director = P2.director) > 250;
    
SELECT *
FROM PELICULA;
    
-- Ejercicio 30: Obtener el a�o o a�os en el que nacieron m�s de 3 actores.

SELECT DISTINCT EXTRACT (YEAR FROM A.fecha_nac) -- ya que fecha_nac no es CP
FROM ACTOR A
WHERE 
    (SELECT COUNT(*)
    FROM ACTOR A2
    WHERE EXTRACT (YEAR FROM A.fecha_nac) = EXTRACT (YEAR FROM A2.fecha_nac)) > 3;
    
-- Ejercicio 31: Obtener el c�digo y nombre del actor m�s joven que ha 
-- participado en una pel�cula clasificada del g�nero de c�digo 'DD8'.

SELECT A.cod_act, A.nombre
FROM ACTOR A
WHERE cod_act IN
    (SELECT cod_act
    FROM ACTUA
    WHERE cod_peli IN
        (SELECT cod_peli
        FROM CLASIFICACION
        WHERE cod_gen = 'DD8')
    )
    AND A.fecha_nac =  
        (SELECT MAX(A1.fecha_nac)
        FROM ACTOR A1
        WHERE cod_act IN
            (SELECT cod_act
            FROM ACTUA
            WHERE cod_peli IN
                (SELECT cod_peli
                FROM CLASIFICACION
                WHERE cod_gen = 'DD8')
            )
        );

----- Consultas universalmente cuantificadas, utilizan la palabra 'todos' 
-- o 'solo'
-- Lo que va despu�s del 'han X' es la Q

-- 32: Obtener el c�digo y el nombre de los pa�ses con actores y tales que todos
-- los actores de ese pa�s han nacido en el siglo XX (ordenados por nombre).

SELECT *
FROM PAIS PA
WHERE NOT EXISTS
    (SELECT *
    FROM ACTOR A
    WHERE PA.cod_pais = A.cod_pais
AND NOT (EXTRACT (YEAR FROM A.fecha_nac)) BETWEEN 1900 AND 2000)
AND EXISTS (SELECT *
    FROM ACTOR A
    WHERE PA.cod_pais = A.cod_pais)
ORDER BY nombre;

-- 33: Obtener el c�digo y el nombre de los actores tales que todos los papeles
-- que han tenido son de 'Secundario'. Solo interesan aquellos actores que
-- hayan actuado en alguna pel�cula.

SELECT cod_act, nombre
FROM ACTOR A
WHERE NOT EXISTS
    (SELECT *
    FROM ACTUA AC
    WHERE A.cod_act = AC.cod_act 
AND NOT papel = 'Secundario')
AND EXISTS (SELECT *
    FROM ACTUA AC
    WHERE A.cod_act = AC.cod_act)
ORDER BY nombre;

-- 34: Obtener el c�digo y el nombre de los actores que han aparecido en todas
-- las pel�culas del director 'Guy Ritchie' (solo si ha dirigido al menos una).

SELECT cod_act, nombre
FROM ACTOR A
WHERE NOT EXISTS
        (SELECT *
        FROM PELICULA P
        WHERE director = 'Guy Ritchie'
    AND NOT EXISTS
            (SELECT *
            FROM ACTUA AC
            WHERE AC.cod_peli = P.cod_peli
            AND AC.cod_act = A.cod_act)
        )
AND EXISTS 
    (SELECT *
    FROM PELICULA P
    WHERE director = 'Guy Ritchie');
    
-- 35: Resolver la consulta anterior pero para el director de nombre 'John Steel'.

SELECT cod_act, nombre
FROM ACTOR A
WHERE NOT EXISTS
        (SELECT *
        FROM PELICULA P
        WHERE director = 'John Steel'
    AND NOT EXISTS
            (SELECT *
            FROM ACTUA AC
            WHERE AC.cod_peli = P.cod_peli
            AND AC.cod_act = A.cod_act)
        )
AND EXISTS 
    (SELECT *
    FROM PELICULA P
    WHERE director = 'John Steel');
    
-- 36: Obtener el c�digo y el t�tulo de las pel�culas de menos de 100 minutos 
-- en las que todos los actores que han actuado son de un mismo pa�s.

SELECT cod_peli, titulo
FROM PELICULA P
WHERE duracion < 100 
AND EXISTS
    (SELECT *
    FROM PAIS PA
    WHERE NOT EXISTS
        (SELECT *
        FROM ACTOR A, ACTUA AC
        WHERE AC.cod_act = A.cod_act
        AND AC.cod_peli = P.cod_peli
AND NOT A.cod_pais = PA.cod_pais))
AND EXISTS 
    (SELECT *
    FROM ACTOR A, ACTUA AC
    WHERE AC.cod_act = A.cod_act
    AND AC.cod_peli = P.cod_peli);

-- 37: Obtener el c�digo, el t�tulo y el a�o de las pel�culas en las que haya
-- actuado alg�n actor si se cumple que todos los actores que han actuado en
-- ella han nacido antes del a�o 1943 (hasta el 31/12/1942).

SELECT cod_peli, titulo, anyo
FROM PELICULA P
WHERE NOT EXISTS
    (SELECT *
    FROM ACTOR A, ACTUA AC
    WHERE A.cod_act = AC.cod_act
    AND AC.cod_peli = P.cod_peli
AND NOT (EXTRACT (year FROM fecha_nac)) < 1943) 
AND EXISTS
    (SELECT *
    FROM ACTOR A, ACTUA AC
    WHERE A.cod_act = AC.cod_act
    AND AC.cod_peli = P.cod_peli)
ORDER BY titulo;

-- 38: Obtener el c�digo y el nombre de cada pa�s si se cumple que todos sus
-- actores han actuado en al menos una pel�cula de m�s de 120 minutos 
-- (ordenados por nombre).
    
SELECT *
FROM PAIS PA
WHERE NOT EXISTS
    (SELECT *
    FROM ACTOR A
    WHERE A.cod_pais = PA.cod_pais
AND NOT EXISTS
    (SELECT *
    FROM PELICULA P, ACTUA AC
    WHERE AC.cod_act = A.cod_act
    AND AC.cod_peli = P.cod_peli
    AND duracion > 120))
AND EXISTS
    (SELECT *
    FROM ACTOR A
    WHERE A.cod_pais = PA.cod_pais)
ORDER BY nombre;

----- Consultas agrupadas -> donde pregunten atributos de tabla + contador
-- En 'Group By' siempre estar�n, al menos, los atributos de Select y de Having
-- Si hay condiciones con los atributos de Select, se pueden poner en Having
-- Si no son atributos de Select, las condiciones se deber�n poner en el WHERE
-- (excepto con el COUNT)

-- 39: Obtener el c�digo y el t�tulo del libro o libros en que se ha basado m�s
-- de una pel�cula, indicando cu�ntas pel�culas se han hecho sobre �l.

SELECT L.cod_lib, L.titulo, COUNT(*) CU�NTAS
FROM LIBRO_PELI L, PELICULA P
WHERE P.cod_lib = L.cod_lib
GROUP BY L.cod_lib, L.titulo
HAVING COUNT(*) > 1;

-- 40: Obtener para cada g�nero en el que se han clasificado m�s de 5 pel�culas,
-- el c�digo y el nombre del g�nero indicando la cantidad de pel�culas del mismo
-- y duraci�n media de sus pel�culas (ordenados por nombre)
-- (La funci�n ROUND redondea al entero m�s cercano).
-- AND: Condiciones para filas
-- HAVING: Condiciones para grupos

SELECT G.cod_gen, G.nombre, COUNT(*), ROUND(AVG(P.duracion))
FROM GENERO G, PELICULA P, CLASIFICACION C
WHERE C.cod_gen = G.cod_gen
    AND C.cod_peli = P.cod_peli
GROUP BY G.cod_gen, G.nombre
HAVING COUNT(*) > 5
ORDER BY nombre;

-- 41: Obtener el c�digo y el t�tulo de las pel�culas de a�o posterior al 2000 
-- junto con el n�mero de g�neros en que est�n clasificadas, si es que est�n en
-- alguno (ordenadas por t�tulo).

SELECT P.cod_peli, P.titulo, COUNT(*) CU�NTOS
FROM PELICULA P, CLASIFICACION C
WHERE anyo > 2000
    AND P.cod_peli = C.cod_peli
GROUP BY P.cod_peli, P.titulo
ORDER BY P.titulo;

-- 42: Obtener los directores que tienen la cadena 'George' en su nombre y que
-- han dirigido exactamente dos pel�culas.

SELECT DISTINCT director
FROM PELICULA P
WHERE director LIKE '%George%'
AND 
    (SELECT COUNT(*)
    FROM PELICULA P2
    WHERE P.director = P2.director) = 2;

----- Opci�n con agrupaciones

SELECT DISTINCT director
FROM PELICULA
WHERE director LIKE '%George%'
GROUP BY director
HAVING COUNT(*) = 2;
    
-- 43: Obtener para cada pel�cula clasificada exactamente en un g�nero y en la
-- que haya actuado alg�n actor, el c�digo, el t�tulo y la cantidad de actores
-- que act�an en ella.
        
SELECT P.cod_peli, P.titulo, COUNT(*) CU�NTOS
FROM PELICULA P, ACTUA AC
WHERE P.cod_peli = AC.cod_peli
    AND (
        SELECT COUNT(*)
        FROM CLASIFICACION C
        WHERE P.cod_peli = C.cod_peli) = 1
GROUP BY P.cod_peli, P.titulo
ORDER BY P.titulo;

-- 44: Obtener el c�digo y el nombre de todos los pa�ses con actores indicando
-- cu�ntos actores de cada pa�s han actuado en al menos una pel�cula de la 
-- d�cada de los 60.

SELECT P.cod_pais, P.nombre, COUNT(*) CU�NTOS
FROM PAIS P, ACTOR A
WHERE P.cod_pais = A.cod_pais
    AND (
        SELECT COUNT(*)
        FROM ACTUA AC, PELICULA P
        WHERE A.cod_act = AC.cod_act
        AND AC.cod_peli = P.cod_peli
        AND P.anyo BETWEEN 1960 AND 1970) > 0
GROUP BY P.cod_pais, P.nombre
ORDER BY P.nombre;
    
-- 45: Obtener el c�digo y el nombre del g�nero en el que hay clasificadas m�s
-- pel�culas (puede haber m�s de uno).

SELECT G.cod_gen, G.nombre
FROM GENERO G, CLASIFICACION C
WHERE G.cod_gen = C.cod_gen
GROUP BY G.cod_gen, G.nombre
HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) -- Aqu� no se podr�an poner nombres de atributos, ya que
    FROM CLASIFICACION C1 -- solo puede devolver una fila
    GROUP BY C1.cod_gen); -- ya que se quieren pel�culas de un g�nero
                                        
-- 46: Obtener el c�digo, el t�tulo y el autor del libro en el que se han basado
-- m�s pel�culas (puede haber m�s de uno).

SELECT L.cod_lib, L.titulo, L.autor
FROM LIBRO_PELI L, PELICULA P
WHERE L.cod_lib = P.cod_lib
GROUP BY L.cod_lib, L.titulo, L.autor
HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) -- Siempre necesita 'Group By'
    FROM PELICULA P
    WHERE P.cod_lib IS NOT NULL -- ya que cod_lib no es CP
    GROUP BY P.cod_lib); -- ya que se quiere las pel�culas basadas en libros
                        
-- 47: Obtener el c�digo y el nombre del pa�s que m�s actores tiene que hayan
-- participado exactamente en 2 pel�culas.

SELECT PA.cod_pais, PA.nombre
FROM PAIS PA, ACTOR A
WHERE PA.cod_pais = A.cod_pais
AND (SELECT (COUNT(*))
    FROM ACTUA AC
    WHERE AC.cod_act = A.cod_act) = 2
GROUP BY PA.cod_pais, PA.nombre
HAVING COUNT(*) =
    (SELECT MAX(COUNT(*)) -- Siempre necesita 'Group By'
    FROM ACTOR A
    WHERE (SELECT (COUNT(*))
    FROM ACTUA AC
    WHERE AC.cod_act = A.cod_act) = 2
    GROUP BY A.cod_pais); -- ya que se quiere los actores de ese pa�s

----- Consultas con Concatenaci�n

-- 50: Obtener para **todos los pa�ses que hay en la base de datos**, el c�digo, el
-- nombre y la cantidad de actores que hay de ese pa�s.

SELECT PA.cod_pais, PA.nombre, COUNT(A.nombre) CU�NTOS -- Para que cuente los actores, no las filas
FROM ACTOR A RIGHT JOIN PAIS PA ON (A.cod_pais = PA.cod_pais) -- incluye las filas de la tabla derecha
GROUP BY PA.cod_pais, PA.nombre -- que no cumplen la condici�n
ORDER BY PA.nombre;

----- Otra opci�n

SELECT PA.cod_pais, PA.nombre,
    (SELECT COUNT(*)
    FROM ACTOR A
    WHERE A.cod_pais = PA.cod_pais) "CU�NTOS"
FROM PAIS PA
ORDER BY PA.nombre;

-- 50 bis: Obtener para todos los pa�ses con actores, el c�digo, el
-- nombre y la cantidad de actores que hay de ese pa�s.

SELECT PA.cod_pais, PA.nombre, COUNT(*) CU�NTOS
FROM ACTOR A, PAIS PA
WHERE A.cod_pais = PA.cod_pais
GROUP BY PA.cod_pais, PA.nombre
ORDER BY PA.nombre;

-- 51: Obtener el c�digo y el t�tulo de **todos los libros de la base de datos** de
-- a�o posterior a 1980 junto con la cantidad de pel�culas a que han dado lugar.

SELECT L.cod_lib, L.titulo, COUNT(P.cod_lib) CU�NTAS
FROM LIBRO_PELI L LEFT JOIN PELICULA P ON (L.cod_lib = P.cod_lib)
WHERE L.anyo > 1980
GROUP BY L.cod_lib, L.titulo;

-- 52: Obtener para *todos los pa�ses que hay en la base de datos*, el c�digo,
-- el nombre y la cantidad de actores que hay de ese pa�s que hayan tenido un 
-- papel como "Secundario" en alguna pel�cula.

SELECT PA.cod_pais, PA.nombre, COUNT(DISTINCT A.cod_act) CU�NTOS
FROM PAIS PA LEFT JOIN (ACTOR A JOIN ACTUA AC
            ON A.cod_act = AC.cod_act AND AC.papel = 'Secundario') 
    ON (PA.cod_pais = A.cod_pais)
GROUP BY PA.cod_pais, PA.nombre
ORDER BY PA.nombre;

-- 53: Obtener para *cada pel�cula que hay en la base de datos* que dure m�s de
-- 140 minutos, el c�digo, el t�tulo, la cantidad de g�neros en los que est�
-- clasificado y la cantidad de actores que han actuado en ella.

SELECT P.cod_peli, P.titulo, COUNT(DISTINCT C.cod_gen) GEN, COUNT(DISTINCT AC.cod_peli) ACT
FROM PELICULA P LEFT JOIN CLASIFICACION C ON (P.cod_peli = C.cod_peli)
    LEFT JOIN ACTUA AC ON (AC.cod_peli = P.cod_peli)
WHERE P.duracion > 140
GROUP BY P.cod_peli, P.titulo
ORDER BY P.titulo;
