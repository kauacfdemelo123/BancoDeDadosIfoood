use ifood;

create table Usuário (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
email varchar(30),
senha varchar(20),
telefone varchar(20),
cpf varchar(14)
);

create table Restaurante (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descrição varchar(30),
telefone varchar(15),
avaliação varchar(30),
cnpj varchar(15)
);

create table categoria_restaurante (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descrição varchar(30)
);

create table Produto (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
preço varchar(5),
descrição varchar(30)
);

create table categoria_produto (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descrição varchar(30)
);

create table prod_add (
id integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table pedid_produ (
id integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table add_prod_pedid (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
quantidade varchar(100)
);

create table Endereço (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
rua varchar(100),
bairro varchar(30),
cidade varchar(30),
cep varchar(10),
número varchar(4),
complemento varchar(12)
);

create table Pedido (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
taxa_entrega float,
valor_total varchar(10),
descrição varchar(30)
);

create table hist_pedido (
id integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table Avaliação (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
restaurante_nota varchar(5),
pedido_nota varchar(5),
descrição varchar(30)
);

create table Adicional (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
valor varchar(10),
descrição varchar(30)
);

create table status_pedido (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descrição varchar(30)
);

create table Pagamento (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
valor float,
dataEhora varchar(20)
);

create table status_pagamento (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descrição varchar(30)
);

create table método_pagamento (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descrição varchar(30)
);

create table cupom (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
código varchar(10),
valor varchar(10),
descrição varchar(30),
validade datetime
);

create table funcionamento (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
hora_abrir time,
hora_fechar time
);
