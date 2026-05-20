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