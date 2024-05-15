use ifood;

create table Usuario (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
email varchar(30) UNIQUE,
senha varchar(20),
telefone varchar(20),
cpf varchar(14) UNIQUE
);

create table Restaurante (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descricao varchar(30),
telefone varchar(15),
avaliacao varchar(30),
cnpj varchar(15)
);

create table categoria_estabelecimento (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descricao varchar(30)
);

create table Produto (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
preco varchar(5),
descricao varchar(30)
);

create table categoria_produto (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(30),
descricao varchar(30)
);

create table prod_add (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table pedid_prod (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table add_prod_pedid (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
quantidade varchar(100)
);

create table Endereco (
id integer not null auto_increment primary key,
date_created datetime,
status integer,
rua varchar(100),
bairro varchar(30),
cidade varchar(30),
cep varchar(10),
numero varchar(4),
complemento varchar(12)
);

create table Pedido (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
taxa_entrega float,
valor_total varchar(10),
descricao varchar(30)
);

create table hist_pedido (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table Avaliacao (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
restaurante_nota varchar(5),
pedido_nota varchar(5),
descricao varchar(30)
);

create table Adicional (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
valor varchar(10),
descricao varchar(30)
);

create table status_pedido (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descricao varchar(30)
);

create table Pagamento (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
valor float,
dataEhora varchar(20)
);

create table status_pagamento (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descricao varchar(30)
);

create table metodo_pagamento (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
nome varchar(20),
descricao varchar(30)
);

create table Cupom (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
codigo varchar(10) NOT NULL,
valor varchar(10),
descricao varchar(30),
validade datetime NOT NULL
);

create table Funcionamento (
ID integer not null auto_increment primary key,
date_created datetime,
status integer,
hora_abrir time,
hora_fechar time
);

create table Favoritos (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

/*Nessa parte do código será feita as FK entre as tabelas */

/*Tabela Restaurante*/
ALTER TABLE restaurante
ADD CONSTRAINT categoria_estabelecimento_FK
FOREIGN KEY(ID_categoria_estabelecimento) REFERENCES categoria_estabelecimento(ID_categoria_estabelecimento);

/*Tabela Endereço*/
ALTER TABLE Endereço
ADD CONSTRAINT Usuario_FK
FOREIGN KEY(ID_Usuario) references Usuario(ID_Usuario);
ALTER TABLE Endereço
ADD CONSTRAINT Restaurante_FK
FOREIGN KEY(ID_Restaurante) references Restaurante(ID_Restaurante);

/*Tabela Produto*/
ALTER TABLE Produto
ADD CONSTRAINT categoria_produto_FK
FOREIGN KEY(ID_categoria_produto) references categoria_produto(ID_categoria_produto);
ALTER TABLE Produto
ADD CONSTRAINT Restaurante_FK
FOREIGN KEY(ID_Restaurante) references Restaurante(ID_Restaurante);

/*Tabela Avaliação*/
ALTER TABLE Avaliacao
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references Pedido(ID_Pedido);

/*Tabela Pedido*/
ALTER TABLE Pedido
ADD CONSTRAINT Endereco_FK
FOREIGN KEY(ID_Endereco) references Endereco(ID_Endereco);
ALTER TABLE Pedido
ADD CONSTRAINT Usuario_FK
FOREIGN KEY(ID_Usuario) references Usuario(ID_Usuario);
ALTER TABLE Pedido
ADD CONSTRAINT Restaurante_FK
FOREIGN KEY(ID_Restaurante) references Restaurante(ID_Restaurante);
ALTER TABLE Pedido
ADD CONSTRAINT Cupom_FK
FOREIGN KEY(ID_Cupom) references Cupom(ID_Cupom);
ALTER TABLE Pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY(ID_status_pedido) references status_pedido(ID_status_pedido);

/*Tabela Adicionar Produto*/
ALTER TABLE prod_add
ADD CONSTRAINT Produto_FK
FOREIGN KEY(ID-Produto) references Produto(ID_Produto);
ALTER TABLE prod_add
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references Pedido(ID_Pedido);

/*Tabela Favoritos*/
ALTER TABLE Favoritos
ADD CONSTRAINT Usuario_FK
FOREIGN KEY(ID_Usuario) references Usuario(ID_Usuario);
ALTER TABLE Favoritos
ADD CONSTRAINT Restaurante_FK
FOREIGN KEY(ID_Restaurante) references Restaurante(ID_Restaurante);

/*Tabela Pedido_Produto*/
ALTER TABLE pedid_prod
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references (ID_Pedido);
ALTER TABLE pedid_prod
ADD CONSTRAINT Produto_FK
FOREIGN KEY(ID_Produto) references Produto(ID_Produto);

/*Tabela Adicional_Produto_Pedido*/
ALTER TABLE add_prod_pedid
ADD CONSTRAINT pedid_prod_FK
FOREIGN KEY(ID_pedid_prod) references pedid_prod(ID_pedid_prod);
ALTER TABLE add_prod_pedid
ADD CONSTRAINT Adicional_FK
FOREIGN KEY(ID_Adicional) references Adicional(ID_Adicional);

/* Tabela Histórico Pedido*/
ALTER TABLE hist_pedido
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references Pedido(ID_Pedido);
ALTER TABLE hist_pedido
ADD CONSTRAINT status_pedido_FK
FOREIGN KEY(ID_status_pedido) references status_pedido(ID_status_pedido);

/*Tabela Pagamento*/
ALTER TABLE Pagamento
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references Pedido(ID_Pedido);
ALTER TABLE Pagamento
ADD CONSTRAINT metodo_pagameento_FK
FOREIGN KEY(ID_metodo_pagamento) references metodo_pagamento(ID_metodo_pagamento);
ALTER TABLE Pagamento
ADD CONSTRAINT status_pagamento_FK
FOREIGN KEY(ID_status_pagamento) references status_pagamento(ID_status_pagamento);

/* Agora vou inserir os dados em cada tabela*/

/* Inserts Tabela Usuario*/
INSERT INTO Usuario(date_created, status, nome, email, senha, telefone, cpf) VALUES
(NOW(), 1, "Kauã", "kauademelo@hotmail.com", "afgb", "(87)94002-8922", "435.876.934-01"),
(NOW(), 1, "Rui", "ruijose@hotmail.com", "acbd", "(87)97689-6543", "365.895.472-01"),
(NOW(), 1, "Carlos", "carlosedu@hotmail.com", "badc", "(87)99132-3420", "132.481.973-01");

/* Inserts Tabela Restaurante*/
INSERT INTO Restaurante(date_created, status, nome, descricao, telefone, avaliacao, cnpj) VALUES
(NOW(), 1, "Nobres House", "Nobres House serve as melhores Pizzas da região", "(87)99346-5402", 5.0, "12347658975432"),
(NOW(), 1, "Churrascaria boi na brasa", "Churrascaria boi na brasa serve os melhores churrascos da cidade", "(87)99234-3120", 4.0, "67894523467581"),
(NOW(), 1, "Restaurante Okomi", "Restaurante Okomi serve as melhores comidas Japonesas da região", "(87)99131-3221", 4.5, "96785432167231");

/* Inserts Tabela categoria_estabelecimento*/
INSERT INTO categoria_estabelecimento(date_created, status , nome, descricao) VALUES
(NOW(), 1, "Pizzaria",  "Restaurante especializado em Pizzas de qualidade!"),
(NOW(), 1, "Churrascaria", "Restaurante especializado em churrascos de qualidade!"),
(NOW(), 1, "Japonês", "Restaurante especializado em comidas japonesas!");

