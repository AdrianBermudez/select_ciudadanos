/*Mostrar los datos de todas las regiones*/
SELECT
	*
FROM
	regiones;
	
/*	Obtener los datos de todos los municipios.*/
SELECT
	*
FROM
	municipios;
/*Mostrar todos los municipios ordenados por código de departamento.*/
SELECT
	*
from
	municipios
ORDER BY cod_depto;
/*Listar los datos de todos los departamentos que pertenecen a la región con nombre
SurOriental.*/
SELECT
	*
FROM
	departamentos
	INNER JOIN regiones
	ON departamentos.cod_region=regiones.cod_region
WHERE
	regiones.nombre="SurOriental";
	
/*Seleccionar a los ciudadanos que pertenecen al municipio con nombre Quetzaltenango, Los
datos a mostrar son DPI, nombre, apellido, dirección y teléfono móvil.*/
SELECT
	ciudadanos.dpi,
	CONCAT (ciudadanos.apellido," ",ciudadanos.nombre) AS nombre_ciudadano,
	ciudadanos.direccion,
	ciudadanos.tel_movil
FROM
	ciudadanos
	INNER JOIN municipios
	ON ciudadanos.cod_muni=municipios.cod_muni
WHERE
	municipios.nombre_municipio="Quetzaltenango";
	
/*Mostrar todos los datos de los ciudadanos que tiene el apellido Pérez.*/
SELECT
	*
FROM
	ciudadanos
WHERE
	apellido LIKE "%Pérez%"
OR
	apellido LIKE "%Perez%";
	
/*Listar a todos los departamentos ordenados por código de región.*/
SELECT
	*
FROM
	departamentos
ORDER BY cod_region;

/*Mostrar los datos de todos los ciudadanos que pertenecen al departamento Escuintla, ordenar
los datos por código de municipio y apellido.*/
SELECT
	*
FROM
	ciudadanos
	INNER JOIN  municipios
	ON ciudadanos.cod_muni=municipios.cod_muni
	INNER JOIN departamentos
	ON municipios.cod_depto=departamentos.cod_depto
WHERE
	departamentos.nombre_depto="Escuintla"
	ORDER BY ciudadanos.cod_muni AND ciudadanos.apellido; 
	
/*Obtener todos los municipios que finalizan con la letra z.*/
SELECT
	*
FROM
	municipios
WHERE
	municipios.nombre_municipio like "%z";
	
/*Mostrar dpi, nombre completo (concatenar nombre y apellido) y teléfono móvil de los
ciudadanos del municipio Mixco, ordenar los datos por apellido de forma descendente.*/

SELECT
	ciudadanos.dpi,
	concat(ciudadanos.nombre," ",ciudadanos.apellido) AS nombre_completo,
	ciudadanos.tel_movil
FROM
	ciudadanos
	INNER JOIN municipios
	ON ciudadanos.cod_muni=municipios.cod_muni
WHERE
	municipios.nombre_municipio= "Mixco"
	order by ciudadanos.apellido DESC;

/*Mostrar todos los ciudadanos que poseen nivel Maestría y pertenecen al departamento
Guatemala, ordenar los datos por código de municipio y apellido.*/
SELECT
	ciudadanos.*
FROM
	ciudadanos
	INNER JOIN municipios
	ON ciudadanos.cod_muni=municipios.cod_muni
	INNER JOIN departamentos
	ON municipios.cod_depto=departamentos.cod_depto
WHERE
	ciudadanos.cod_nivel_acad="Maestría"
	AND departamentos.nombre_depto="Guatemala"
ORDER BY ciudadanos.cod_muni, apellido;

/*12. Agregar un nuevo Ciudadano, los datos son los siguientes*/
SELECT* FROM ciudadanos WHERE dpi=2283761300101;
INSERT INTO ciudadanos
	(dpi, apellido, nombre, direccion, tel_casa, tel_movil, email, fechanac, cod_nivel_acad, cod_muni)
VALUES
	(2283761300101,
	"Zoila Nue",
	"Vaciuda Dana",
	"1 calle 1-11 zona 1",
	23234545,
	56567878,
	"zoilavd@mail.com",
	"1995-01-01",
	5,
	101);
/*13.agregar una nueva región, invente los datos*/
SELECT * FROM regiones WHERE nombre="santa rosa";
INSERT INTO regiones(cod_region, nombre, descripcion)
VALUES(11, "santa rosa","Región inventada");

/*14. Agregar un nuevo departamento para la región inventada.*/
SELECT * FROM departamentos;
INSERT INTO departamentos(cod_depto, nombre_depto, cod_region)
VALUES(31, "Nueva esperanza",8);

/*15. Agregar un nuevo municipio en el departamento creado en el inciso anterior.*/
SELECT * FROM municipios;
INSERT INTO municipios(cod_muni, nombre_municipio, cod_depto)
VALUES(31,"San Miguel Petapa",12);

/*16. Agregar un nuevo nivel académico, invente los datos.*/
SELECT * FROM nivelesacademicos;
INSERT INTO nivelesacademicos(cod_nivel_acad, nombre, descripcion)
VALUES(9,"pre-primaria","Antes de primaria");

/*17. Agregar nombre, teléfono de casa, teléfono móvil, 
código de nivel académico, código de
municipio y dpi para un ciudadano. (invente los datos).*/
SELECT * FROM ciudadanos;
INSERT INTO ciudadanos(nombre, tel_casa, tel_movil, cod_nivel_acad, cod_muni, dpi)
VALUES("Emmanuel","45151717","53651414",6,414,"39605420101");

/*Update
18. Cambiar la dirección y el teléfono para el 
ciudadano con el DPI 1043613481222
, los nuevos
datos*/

UPDATE ciudadanos
SET
	direccion= "7ma. calle 7-77 zona 7",
	tel_casa= 22224444
WHERE dpi= 1043613481222;

/*19. Modificar el correo electrónico para el ciudadano con el DPI 1029518161711
 este debe ser
zoyelnuevo@mail.com.*/
UPDATE ciudadanos
SET
	email="zoyelnuevo@mail.com."
WHERE dpi=1029518161711;

/*20. Modificar Apellido, dirección, teléfono de casa, 
teléfono móvil y fecha de nacimiento de algún
ciudadano existente, invente todos los datos.*/
UPDATE ciudadanos
SET
	apellido= "linares",
	direccion= "19ave 4-09 zona 13",
	tel_casa= "55661233",
	tel_movil="11445566",
	fechanac= "2003/9/12"
WHERE dpi=1007928191909;

/*21. Cambiar el nombre de la región agregada 
en el inciso 13, el nombre debe ser Región 13.*/
UPDATE regiones
SET
	nombre="Región 13"
WHERE cod_region= 11;

/*22. Modificar los datos del nivel académico 
agregado en el inciso 16, el nombre debe ser 
Nivel 16 y en la descripción colocar el texto 
nombre modificado en la consulta 22.*/

UPDATE nivelesacademicos
SET
	nombre= "Nivel 16",
	descripcion="nombre modificado en la consulta 22"
WHERE nombre="pre-primaria";

/*Delete
23. Eliminar el nivel académico inventado.*/

SELECT * FROM nivelesacademicos WHERE cod_nivel_acad=9;
DELETE FROM nivelesacademicos
WHERE cod_nivel_acad=9;

/*24. Eliminar todos los ciudadanos que 
nacieron en el municipio con el código 2217*/
SELECT * FROM ciudadanos WHERE cod_muni=2217;
DELETE FROM ciudadanos
WHERE cod_muni=2217;

/*25. Eliminar al ciudadano con DPI 1008136551007*/
SELECT * FROM ciudadanos WHERE dpi=1008136551007;
DELETE FROM ciudadanos
WHERE dpi=1008136551007;

/*26. Eliminar a todos los ciudadanos que 
nacieron en el municipio 101 y que tienen fecha de
nacimiento menor a 1980.*/
SELECT * FROM ciudadanos 
WHERE cod_muni= 101 
and fechanac<"1980/01/01";
DELETE FROM ciudadanos
WHERE cod_muni= 101 
and fechanac<"1980/01/01";

/*27. Eliminar todos los departamentos de la región no. 7*/
SELECT * FROM departamentos WHERE cod_region=7;
DELETE FROM departamentos
WHERE cod_region=7;

/*28. Eliminar a los ciudadanos con teléfono móvil 33734648 y 
teléfono de casa 21243830*/
SELECT * FROM ciudadanos 
WHERE tel_movil= 33734648 AND tel_casa=21243830;
DELETE FROM ciudadanos
WHERE tel_movil= 33734648 AND tel_casa=21243830;