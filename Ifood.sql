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

create table produto_adicional (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table pedido_produto (
ID integer not null auto_increment primary key,
date_created datetime,
status integer
);

create table adicional_produdo_pedido (
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

create table historico_pedido (
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
ALTER TABLE produto_adicional
ADD CONSTRAINT Produto_FK
FOREIGN KEY(ID-Produto) references Produto(ID_Produto);
ALTER TABLE produto_adicional
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
ALTER TABLE pedidp_produto
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references (ID_Pedido);
ALTER TABLE pedido_produto
ADD CONSTRAINT Produto_FK
FOREIGN KEY(ID_Produto) references Produto(ID_Produto);

/*Tabela Adicional_Produto_Pedido*/
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT pedido_produto_FK
FOREIGN KEY(ID_pedido_produto) references pedido_produto(ID_pedido_produto);
ALTER TABLE adicional_produto_pedido
ADD CONSTRAINT Adicional_FK
FOREIGN KEY(ID_Adicional) references Adicional(ID_Adicional);

/* Tabela Histórico Pedido*/
ALTER TABLE historico_pedido
ADD CONSTRAINT Pedido_FK
FOREIGN KEY(ID_Pedido) references Pedido(ID_Pedido);
ALTER TABLE historico_pedido
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

/* Inserts Tabela Usuario */
INSERT INTO Usuario(date_created, status, nome, email, senha, telefone, cpf) VALUES
(NOW(), 1, "Kauã", "kauademelo@hotmail.com", "afgb", "(87)94002-8922", "435.876.934-01"),
(NOW(), 1, "Rui", "ruijose@hotmail.com", "acbd", "(87)97689-6543", "365.895.472-01"),
(NOW(), 1, "Carlos", "carlosedu@hotmail.com", "badc", "(87)99132-3420", "132.481.973-01");

/* Inserts Tabela Restaurante */
INSERT INTO Restaurante(date_created, status, nome, descricao, telefone, avaliacao, cnpj) VALUES
(NOW(), 1, "Nobres House", "Nobres House serve as melhores Pizzas da região", "(87)99346-5402", 5.0, "12347658975432"),
(NOW(), 1, "Churrascaria boi na brasa", "Churrascaria boi na brasa serve os melhores churrascos da cidade", "(87)99234-3120", 4.0, "67894523467581"),
(NOW(), 1, "Restaurante Okomi", "Restaurante Okomi serve as melhores comidas Japonesas da região", "(87)99131-3221", 4.5, "96785432167231");

/* Inserts Tabela categoria_estabelecimento */
INSERT INTO categoria_estabelecimento(date_created, status , nome, descricao) VALUES
(NOW(), 1, "Pizzaria",  "Restaurante especializado em Pizzas de qualidade!"),
(NOW(), 1, "Churrascaria", "Restaurante especializado em churrascos de qualidade!"),
(NOW(), 1, "Japonês", "Restaurante especializado em comidas japonesas!");

/* Inserts Tabela Endereço */
INSERT INTO Endereco(date_created, status, rua, bairro, cidade, cep, numero, complemento, padrao) VALUES
(NOW(), 1, "Rua Avenida Capitão Justino Alves", "Bairro A", "Venturosa", "34567-987", "104", "Próximo ao shopping", 1),
(NOW(), 1, "Rua Avenida Paulita", "Bairro B", "Recife", "78905-321", "108", "Próximo à praia", 0),
(Now(), 1, "Rua Avenida Brasil", "Bairro C", "Arcoverde", "45678-354", "71", "Próximo da Loja Americanas", 0);

/* Inserts Tabela Produto */
INSERT INTO Produto(date_created, status, nome, preco, descricao) VALUES
(NOW(), 1, "Pizza de Frango", 20, "Recheio de Frango e quiejo Mussarela"),
(NOW(), 1, "Churrasco Misto", 50, "combom: picanha, frango, linguiça e carne de porco"),
(NOW(), 1, "Sushi", 35, "Combo de Sushi completo");

/* Inserts Tabela categoria_produto */
INSERT INTO categoria_produto(date_created, status, nome, descricao) VALUES
(NOW(), 1, "Pizza", "Variedades de Pizzas"),
(NOW(), 1, "Churrasco", "Carnes na Brasa"),
(NOW(), 1, "Sushi", "O melhor da culinária Japonesa");

/* Inserts Tabela Adicional */
INSERT INTO Adicional(date_created, status, nome, valor, descricao) VALUES
(NOW(), 1, "Queijo Chedeer", 5, "Adicional de Queijo Chedeer na sua pizza"),
(NOW(), 1, "Bacon", 15, "Adicional de Bacon no seu prato"),
(NOW(), 1, "Molho Especial", 5, "Molho Especial para deixar seu prato mais saboroso");

/* Inserts Tabela Pedido */
INSERT INTO Pedido(date_created, status, taxa_entrega, valor_total, descricao) VALUES
(NOW(), 1, 5, 30, "Pedido para entrega em casa"),
(NOW(), 1, 5, 70, "Pedido para retirada no restaurante"),
(NOW(), 1, 5, 45, "Pedido para entrega na faculdade");

/* Inserts Tabela status_pedido */
INSERT INTO status_pedido(date_created, status, nome, descricao) VALUES
(NOW(), 1, "Em Processamento", "Pedido está em processo para entrega"),
(NOW(), 1, "Pronto para entrega", "Pedido está pronto para ser entregue ao cliente"),
(NOW(), 1, "Pedido Entregue", "Pedido foi entregue ao cliente com sucesso");

/* Inserts Tabela histórico_pedido */
INSERT INTO historico_pedido(date_created, status, ID_Pedido, ID_status_pedido) VALUES
(NOW(), 1, 1, 1),
(NOW(), 1, 2, 2),
(NOW(), 1, 3, 3);

/* Inserts Tabela Cupom */
INSERT INTO cupom(date_created, status, codigo, valor, descricao, validade) VALUES
(NOW(), 1, "Desconto10%", 10, "Você terá um Desconto de 10% em seu próximo pedido"),
(NOW(), 1, "Desconto20%", 20, "Vpcê terá um Desconto de 20% em seu próximo pedido"),
(NOW(), 1, "Desconto30%", 30, "Você terá um Desconto de 30% em seu próximo pedido");

/* Inserts Tabela adicional_produto_pedido */
INSERT INTO adicional_produto_pedido(date_created, status, quantidade, ID_Adicional, ID_Produto) VALUES
(NOW(), 1, 1, 1, 1),
(NOW(), 1, 2, 2, 2),
(NOW(), 1, 3, 3, 3);

/* Inserts Tabela Avaliação */
INSERT INTO Avaliacao(date_created, status, restaurante_nota, pedido_nota, descricao) VALUES
(NOW(), 1, 5, 4, "Excelente atendimento e comida deliciosa!"),
(NOW(), 1, 4, 2, "Comida muito boa, mas a entrega deixou um pouco a desejar!"),
(NOW(), 1, 4, 4, "Comida deliciosa e atendimento muito bom!");

/* Inserts Tabela Pagamento */
INSERT INTO Pagamento(date_created, status, valor, data_hora) VALUES
(NOW(), 1, 30, "20/05/2024 14:00"),
(NOW(), 1, 70, "20/05/2024 13:20"),
(NOW(), 1, 45, "20/05/2024 19:30);


  
  
