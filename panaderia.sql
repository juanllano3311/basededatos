create database panaderia 

use panaderia


create table distribuidora(
DNI int not null,
nombre varchar(30) not null,
direccion varchar(20) null,
constraint pk_distri primary key (DNI))

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
id_distri int not null,
constraint pk_prod primary key(cod_producto),
constraint fk_di foreign key(id_distri) references distribuidora(DNI))


create table factura(
num_factura int not null,
id_prod int not null,
fecha date not null,
cantidad int not null,
total int not null,
hora datetime null,
constraint pk_factur primary key(num_factura),
constraint fk_prof foreign key(id_prod) references producto(cod_producto))

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

