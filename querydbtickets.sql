create database sisticket;
use sisticket; 
create table usuario (
	id int not null auto_increment primary key,
	nombre varchar(50),
	apellido varchar(50),
	correo varchar(255),
	password varchar(60),
	created_at datetime
    );

create table categoria (
	id int not null auto_increment primary key,
	nombre_cat varchar(200)
	);
    
create table estado (
	id int not null auto_increment primary key,
	nombre_estado varchar(100)
);

create table equipo (
	id int not null auto_increment primary key,
	nombre_equipo varchar(100)
);

create table prioridad (
	id int not null auto_increment primary key,
	nombre_prioridad varchar(100)
);

create table empleado (
	id int not null auto_increment primary key,
    id_usuario int not null,
    id_equipo int not null,
    foreign key (id_usuario) references usuario(id),
    foreign key (id_equipo) references equipo(id)
);

create table solicitante (
	id int not null auto_increment primary key,
	id_usuario int not null,
    id_equipo int not null,
    foreign key(id_usuario) references usuario(id),
    foreign key(id_equipo) references equipo(id)
);

create table ticket(
	id int not null auto_increment primary key,
	titulo varchar(100),
	description text,
	updated_at datetime,
	created_at datetime,
    id_categoria int not null,
    id_estado int not null,
	id_empleado int not null,
    id_solicitante int not null,
	id_asignacion int not null,
	id_prioridad int not null,
    foreign key (id_categoria) references categoria(id),
	foreign key (id_estado) references estado(id),
	foreign key (id_empleado) references empleado(id),
	foreign key (id_solicitante) references solicitante(id),
    foreign key (id_prioridad) references prioridad(id)
);