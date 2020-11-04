use club


select * from actor

create table pelicula(
cod_pelicula int,
titulo varchar(30),
categoria varchar(20),
cod_actor2 int,
constraint pk_pe primary key(cod_pelicula),
constraint fk_pe foreign key(cod_actor2) references actor(cod_actor))


create table cassette(
cod_cassete int not null,
num_copias int not null,
formato varchar(20) not null,
cod_pelicula2 int,
constraint pk_cass primary key(cod_cassete),
constraint fk_peli foreign key(cod_pelicula2) references pelicula(cod_pelicula))

create table membresia(
num_membresia int not null,
valor_membresia int not null,
constraint pk_cli primary key(num_membresia))


create table cliente(
cod_cliente int,
nom_cliente varchar(40) not null,
dir_cliente varchar(45) null,
telef varchar(15) not null,
num_membresia2 int not null,
constraint pk_clivfv primary key(cod_cliente),
constraint fk_mem foreign key(num_membresia2) references membresia(num_membresia))






create table alquiler(
cod_alquiler int not null,
cod_cassetalq int not null,
cod_clientealq int not null,
fecha_dev date not null,
fecha_alquiles date not null,
valor_alquiler int not null,
cantidad int not null,
constraint pk_alqui primary key(cod_alquiler),
constraint fk_cassalq foreign key(cod_cassetalq) references cassette(cod_cassete),
constraint fk_clialq foreign key(cod_clientealq) references cliente(cod_cliente))
