use panaderia

select * from domicilios

select * from factura

select * from prod_factur

select * from producto

select * from repartidor

--Consulta con letra
select * from repartidor where nombre like 'j%'

select * from repartidor where nombre like 'f%'

--Nombre con nombre especifico 
select * from repartidor where nombre like 'sacarias junior'

select * from repartidor where nombre like 'sacarias%'

--Consulta en orden ascendente 
select * from repartidor order by nombre asc

select * from producto order by nombre asc

--Consulta en orden descendente 
select * from repartidor order by nombre desc

select * from producto order by nombre desc

--Clausula count 
select cod_pro, count(cod_pro) as cantidad from prod_factur group by cod_pro

--Sumas
select sum(total)as suma_total from factura

--Antes de between
select * from factura where num_factura>=10 and num_factura<=30

--Con between
select * from factura where num_factura between 10 and 30

--Consulta con información especifica
select * from repartidor where(nombre in('fernando zapata'))

--Consulta para mostrar los demas excepto el elegido
select * from repartidor where(nombre not in('fernando zapata'))

--Consulta para mostrar los primeros registros de la tabla
select top 10 * from prod_factur

--Consulta sin repeticiones en la tabla 
select distinct cod_pro, cod_factur from prod_factur

--Promedio de una columna
select avg(total) as promedio_valor from factura

--Valor mas alto de una columna
select max(total) as valor_maximo from factura

--Valor mas bajo de una columna
select min(total) as valor_minimo from factura