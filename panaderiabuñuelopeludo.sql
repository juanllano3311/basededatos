--Creamos la bd--
create database panaderia 
--usamos la bd panaderia--
use panaderia


--creamos las tablas de nuestra bd--
create table repartidor(
id_repartidor int not null,
nombre varchar(40)not null,
telefono varchar(10) not null,
correo varchar(50) null,
placa varchar(6) not null,
constraint pk_repar primary key(id_repartidor))

select * from repartidor

create table producto(
cod_producto int not null,
nombre varchar(20) not null,
constraint pk_prod primary key(cod_producto))


create table prod_factur(
cod_pro int not null,
cod_factur int not null,
constraint fk_p foreign key(cod_pro) references producto(cod_producto),
constraint fk_f foreign key(cod_factur) references factura(num_factura))


create table factura(
num_factura int not null,
fecha date not null,
cantidad int not null,
total int not null,
hora datetime null,
constraint pk_factur primary key(num_factura))

create table domicilios(
id_domicilio int not null,
direccion varchar(40) not null,
id_repar int not null,
fecha date not null,
valor int null,
id_fac int not null,
constraint pk_domi primary key(id_domicilio),
constraint fk_repar foreign key(id_repar) references repartidor(id_repartidor),
constraint fk_factur foreign key(id_fac) references factura(num_factura))




select * from producto
--insertamos los registros correspondientes de cada tabla de nuestra bd--
insert into producto (cod_producto,nombre) values (1,'buñuelo')
insert into producto (cod_producto,nombre) values (2,'pan de queso')
insert into producto (cod_producto,nombre) values (3,'roscon')



select * from factura

insert into factura(num_factura,fecha,cantidad,total,hora) values (10,'2020-11-08',5,2000,'8:00:00')
insert into factura(num_factura,fecha,cantidad,total,hora) values (20,'2020-11-07',10,4000,'6:00:00')
insert into factura(num_factura,fecha,cantidad,total,hora) values (30,'2020-11-06',4,1600,'12:00:00')



--modificamos el tipo de campo--
alter table factura alter column hora time

--agregamos la columna precio a la tabla prdoducto--
alter table producto add precio int


select * from producto



--eliminamos todos los campos de la tabla factura--
delete factura

go

--modificamos los precios de la tabla producto--
update producto set precio=400 where nombre='buñuelo'
update producto set precio=1500 where cod_producto=2
update producto set precio=800 where cod_producto=3

select * from repartidor


--insertamos los datos de la tabla repartidor--
insert into repartidor (id_repartidor,nombre,telefono,correo,placa) values (1,'juan','3007166045','juan@gmail.com','fls123')
insert into repartidor (id_repartidor,nombre,telefono,correo,placa) values (2,'sacarias junior','3215684745','juniorsacarias@gmail.com','kkk666')
insert into repartidor (id_repartidor,nombre,telefono,correo,placa) values (3,'fernando zapata','3204589678','fernando@gmail.com','knm425')



select * from domicilios
--insertamos los datos de la tabla domicilios--

insert into domicilios(id_domicilio,direccion,id_repar,fecha,valor,id_fac) values (10,'cl 6 sur #79-150',3,'2020-11-7',2000,10)

insert into domicilios(id_domicilio,direccion,id_repar,fecha,valor,id_fac) values (20,'cl 1 #20-30',2,'2020-11-7',2000,20)


select * from factura

select * from producto

select * from prod_factur

--insertamos datos en la tabla intermedia prod-factur--


insert into prod_factur(cod_pro,cod_factur) values (3,30)



--modificaos el total de una factura--
update factura set total=3500 where num_factura=30

select * from domicilios

--consultamos campos con su respectiva relacion--
select nombre,precio,num_factura,fecha from producto inner join prod_factur on prod_factur.cod_pro=producto.cod_producto inner join factura on prod_factur.cod_factur=factura.num_factura where num_factura=10
select nombre,precio,num_factura,fecha from producto inner join prod_factur on prod_factur.cod_pro=producto.cod_producto inner join factura on prod_factur.cod_factur=factura.num_factura where num_factura=20
select nombre,precio,num_factura,fecha from producto inner join prod_factur on prod_factur.cod_pro=producto.cod_producto inner join factura on prod_factur.cod_factur=factura.num_factura where num_factura=30




