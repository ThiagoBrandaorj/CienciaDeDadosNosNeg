-- CREATE SCHEMA `pedido_venda` DEFAULT CHARACTER SET utf8 ;
use pedido_venda;

/* Criação da tabela Cliente */
CREATE TABLE cliente (
    cliente_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(64) NOT NULL,
    cpf BIGINT NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1), -- M = Masculino e F = Feminino I = Indefinido
    profissao VARCHAR(32),
    observacoes TEXT
);


-- Inserindo registros na tabela cliente 
INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes) 
VALUES ('Rodrigo', 03215698711, '1980-01-25', 'M', 'Empresário', 'Vegan');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes) 
VALUES ('João', 12345678901, '1985-06-20', 'M', 'Engenheiro', NULL);

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Maria', 23456789012, '1990-04-15', 'F', 'Professora', 'Vegetariana');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Pedro', 34567890123, '1987-09-30', 'M', 'Médico', 'Diabético');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Ana', 45678901234, '1986-11-12', 'F', 'Arquiteta', 'Alergia a gato');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Luís', 56789012345, '1989-03-25', 'M', 'Advogado', 'Hipertenso');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Carolina', 67890123456, '1992-07-09', 'F', 'Eng. Mecânico', 'Vegan');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Felipe', 78901234567, '1988-01-22', 'M', 'Psicólogo', 'Sem glúten');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Laura', 89012345678, '1991-05-11', 'F', 'Veterinária', 'Gestante');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Bruno', 90123456789, '1993-12-18', 'M', 'Jornalista', 'Fumante');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Patricia', 01234567890, '1995-10-06', 'F', 'Vet.', 'Corredora');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Roberto', 09876543210, '1990-02-14', 'M', 'Programador', 'Ciclista');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Fernanda', 08765432109, '1987-08-08', 'F', 'Nutricionista', NULL);

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Gustavo', 07654321098, '1984-05-05', 'M', 'Químico', 'Vegetariano');

INSERT INTO cliente (nome, cpf, data_nascimento, sexo, profissao, observacoes)
VALUES ('Aline', 06543210987, '1992-12-12', 'F', 'Bióloga', 'Sem lactose');


-- Seleciona todos os registros com todas as colunas da tabela cliente
select * from cliente;

-- Seleciona todas as linhas da tabela cliente, com somente as colunas nome e data_nascimento
select nome, data_nascimento from cliente;

-- Criamos apelidos (alias) para o nome das colunas nome e data_nascimento
select nome as "Nome", data_nascimento as "Data de Nascimento" from cliente;

-- Criamos uma concatenação de colunas, Nome: [nome] CPF: [CPF] com o nome da coluna como Nome_Cpf
select concat('Nome: ',nome,' CPF: ',cpf) from cliente;

-- Selecionado apenas os 5 primeiro registros da tabela Cliente
select * from cliente limit 5;

-- Selecionar todos os clientes que nasceram após janeiro de 1989
select * from cliente where data_nascimento > '1989-01-01';

-- Selecionar todos os clientes que nasceram antes janeiro de 1989
select * from cliente where data_nascimento < '1989-01-01';

-- Selecionar os clientes que nasceram entre janeiro de 1980 e janeiro de 1985
select * from cliente where data_nascimento > '1980-01-01' AND data_nascimento < '1985-01-01';
select * from cliente where data_nascimento BETWEEN '1980-01-01' AND '1985-01-01';

-- Seleciona todos os registros que o nome CONTENHA com a letra R
select * from cliente where nome like '%R%';

-- Seleciona todos os registros que o nome COMECE com a letra R
select * from cliente where nome like 'R%';

-- Seleciona todos os registros que o nome TERMINE com a letra O
select * from cliente where nome like '%o';

-- Seleciona todos os registros que o nome CONTENHA com a sequencia de caracteres letra ia
select * from cliente where nome like '%ia%';

-- Seleciona todos os registros que esteja com o campo observacoes com o valor nulo
select * from cliente where observacoes is null;

-- seleciona o nome e a observaçao e caso a observacao contenha nulo como valor, retorna 'NÃO PREENCHIDO'
select nome, ifnull(observacoes,'NÃO PREENCHIDO') as observacoes from cliente;

-- Ordena os registros de forma ascendente pelo nome
select * from cliente order by nome asc;

-- Ordena os registros de forma descendente pelo nome
select * from cliente order by nome desc;

-- Ordena os registros de forma ascendente pelo nome e descendente pela data_nascimento
select * from cliente order by nome asc, data_nascimento desc;

-- USANDO O COMANDO UPDATE, PARA ALTERAR DADOS
-- Alterar o nome do cliente rodrigo para Rodrigo Campos

update cliente set
nome = 'Rodrigo Campos'
where cliente_id = 1;

select * from cliente; 

-- alterando o campo Sexo para 'I' e cpf para 123 do registro 1
update cliente set
sexo = 'I',
cpf = 123
where cliente_id = 1;



insert into cliente(nome, cpf, sexo)
values('Ruan', 98765432101, 'M');

insert into cliente(nome, cpf, data_nascimento, sexo)
values('Casimiro', 98765432102, '1979-08-09', 'M');

insert into cliente(nome, cpf, profissao)
values('Anelise', 98765432103, 'Arquiteta');



-- 2 - Altere os dados do cliente Ruan
-- 	- O sexo para M
-- 	 - A data de nascimento para 05/02/1982
-- 	 - A profissão para Engenheiro civil
--  - A observação para Detalhista

update cliente set
sexo = 'M',
data_nascimento = '1982-02-05',
profissao = 'Engenheiro civil',
observacoes = 'Detalhista' 
where cliente_id = 16;


-- 3 - Altere os dados do cliente Casimiro
-- 	3.1 - A data de nascimento para 19/08/1979
-- 	3.2 - O nome para Casimiro Pereira

update cliente set
nome = 'Casimiro Pereira', 
data_nascimento = '1979-08-19'
where cliente_id = 17;

-- 4 - Altere os dados da cliente Anelise
-- 	4.1 - A profissão para Psicóloga
-- 	4.2 - O sexo para F
-- 	4.3 - E as observações para Psicóloga psicoterapeuta


update cliente set
profissao = 'Psicóloga',
Sexo = 'F',
Observacoes = 'Psicóloga psicoterapeuta'
where cliente_id = 18;

select * from cliente;


-- 5 - Apague o cliente Casimiro
delete from cliente where cliente_id = 17;

-- 6 - Apague a cliente Anelise
delete from cliente where cliente_id = 18;

-- -----------------------------------------------
-- Criando a tabela Profissao
-- -----------------------------------------------
-- drop table profissao;
CREATE TABLE profissao (
    profissao_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32) NOT NULL UNIQUE
);

-- USO DO CONCAT PARA GERAR INSTRUCOES DE INSER
-- select distinct profissao from cliente order by profissao;
select distinct concat('insert into profissao (nome) values (''',profissao,''');') from cliente order by profissao;


insert into profissao (nome) values ('Advogado');
insert into profissao (nome) values ('Arquiteto');
insert into profissao (nome) values ('Biólogo');
insert into profissao (nome) values ('Empresário');
insert into profissao (nome) values ('Engenheiro Mecânico'); 
insert into profissao (nome) values ('Engenheiro');
insert into profissao (nome) values ('Engenheiro Civil');
insert into profissao (nome) values ('Jornalista');
insert into profissao (nome) values ('Médico');
insert into profissao (nome) values ('Nutricionista');
insert into profissao (nome) values ('Programador');
insert into profissao (nome) values ('Psicólogo');
insert into profissao (nome) values ('Químico');
insert into profissao (nome) values ('Veterinário');


-- criando a tabela genero
CREATE TABLE genero (
    genero_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(32) NOT NULL UNIQUE
);

insert into genero (nome) values('Masculino');
insert into genero (nome) values('Feminino');



-- Remonear a coluna sexo para genero
ALTER TABLE cliente CHANGE sexo genero CHAR(1);
select * from cliente;


-- Criar a coluna genero_id na tabela cliente
alter table cliente add genero_id integer;

-- Criando um relacionamento da chave estrangeira genero_id da tabela cliente com a chave primaria genero_id da tabela genero
alter table cliente add constraint fk_cliente_genero_id foreign key (genero_id) references genero(genero_id);

-- Voltando para char 1 o campo genero
ALTER TABLE cliente MODIFY genero char(1);

select * from cliente;


update cliente set 
genero = 'M'
where cliente_id in(1,2,4,6,8,10,12,14,16);

update cliente set 
genero = 'F'
where cliente_id = '0';


select * from cliente;

update cliente set genero_id = 1 WHERE genero = 'M'; 
update cliente set genero_id = 2 WHERE genero = 'F'; 

-- Excluindo a coluna genero
alter table cliente drop genero;

delete from genero where genero_id=1;


-- Criacao do relacionamento entre a tabela cliente e a tabela profissão

-- Criando a coluna profissao_id na tabela cliente
alter table cliente add profissao_id integer;

-- Criar a chave estrangeira da coluna profissao_id na tabela cliente com a coluna profissao_id na tabela profissao
alter table cliente add constraint fk_cliente_profissao_id foreign key (profissao_id) references profissao(profissao_id);

update cliente set profissao_id = 1 where cliente_id = 6;
update cliente set profissao_id = 2 where cliente_id = 5;
update cliente set profissao_id = 3 where cliente_id = 15;
update cliente set profissao_id = 4 where cliente_id = 1;
update cliente set profissao_id = 5 where cliente_id = 7;
update cliente set profissao_id = 6 where cliente_id = 2;
update cliente set profissao_id = 7 where cliente_id = 16;
update cliente set profissao_id = 8 where cliente_id = 10;
update cliente set profissao_id = 9 where cliente_id = 3;
update cliente set profissao_id = 9 where cliente_id = 4;
update cliente set profissao_id = 10 where cliente_id = 13;
update cliente set profissao_id = 11 where cliente_id = 12;
update cliente set profissao_id = 12 where cliente_id = 8;
update cliente set profissao_id = 13 where cliente_id = 14;
update cliente set profissao_id = 14 where cliente_id = 11;
update cliente set profissao_id = 14 where cliente_id = 9;


-- Excluimos a coluna profissao
alter table cliente drop profissao;

select * from cliente;


-- Criando a estrutura para cadastro de endereco do cliente


-- Criação da tabela de UF
create table uf(
	uf_id integer not null primary key AUTO_INCREMENT,
	sigla char(2) not null unique,
	nome varchar(32) not null unique
);

insert into uf(sigla, nome) values ('AC', 'Acre');
insert into uf(sigla, nome) values ('AL', 'Alagoas');
insert into uf(sigla, nome) values ('AP', 'Amapá');
insert into uf(sigla, nome) values ('AM', 'Amazonas');
insert into uf(sigla, nome) values ('BA', 'Bahia');
insert into uf(sigla, nome) values ('CE', 'Ceará');
insert into uf(sigla, nome) values ('DF', 'Distrito Federal');
insert into uf(sigla, nome) values ('ES', 'Espírito Santo');
insert into uf(sigla, nome) values ('GO', 'Goiás');
insert into uf(sigla, nome) values ('MA', 'Maranhão');
insert into uf(sigla, nome) values ('MT', 'Mato Grosso');
insert into uf(sigla, nome) values ('MS', 'Mato Grosso do Sul');
insert into uf(sigla, nome) values ('MG', 'Minas Gerais');
insert into uf(sigla, nome) values ('PA', 'Pará');
insert into uf(sigla, nome) values ('PB', 'Paraíba');
insert into uf(sigla, nome) values ('PR', 'Paraná');
insert into uf(sigla, nome) values ('PE', 'Pernambuco');
insert into uf(sigla, nome) values ('PI', 'Piauí');
insert into uf(sigla, nome) values ('RJ', 'Rio de Janeiro');
insert into uf(sigla, nome) values ('RN', 'Rio Grande do Norte');
insert into uf(sigla, nome) values ('RS', 'Rio Grande do Sul');
insert into uf(sigla, nome) values ('RO', 'Rondônia');
insert into uf(sigla, nome) values ('RR', 'Roraima');
insert into uf(sigla, nome) values ('SC', 'Santa Catarina');
insert into uf(sigla, nome) values ('SP', 'São Paulo');
insert into uf(sigla, nome) values ('SE', 'Sergipe');
insert into uf(sigla, nome) values ('TO', 'Tocantins');


-- Criação da tabela de cidade
create table cidade(
	cidade_id integer not null  primary key AUTO_INCREMENT,
	uf_id integer not null,
	nome varchar(128) not null,
    constraint fk_cidade_uf_id foreign key(uf_id) references uf(uf_id)
);

select * from uf;
select * from cidade;

insert into cidade(uf_id, nome) values 
(19, 'Rio de Janeiro'),
(19, 'Niteroi'),
(19, 'Petrópolis'),
(19, 'Volta Redonda'),
(19, 'Duque de Caxias'),
(19, 'Nova Iguaçu'), 
(19, 'Belford Roxo'),
(19, 'São Gonçalo'),
(19, 'Campos dos Goytacazes'),
(19, 'Angra dos Reis');



-- criando a tabela de endereços
create table endereco(
	endereco_id integer not null primary key AUTO_INCREMENT,
	cidade_id integer not null,
	logradouro varchar(128),
	numero varchar(16),
	complemento varchar(64),
	bairro varchar(128),
	cep char(8),
	
	constraint fk_endereco_cidade_id foreign key(cidade_id) references cidade(cidade_id)
);


-- inserindo alguns endereços
INSERT INTO endereco (cidade_id, logradouro, numero, complemento, bairro, cep) VALUES
(1, 'Rua das Flores', '123', 'Sala 411', 'Centro', '20011000'),
(2, 'Avenida Brasil', '456', '', 'Bosque', '24346000'),
(3, 'Rua 7 de Setembro', '789', 'Bloco B', 'Formoso', '25685000'),
(4, 'Avenida da União', '101', 'Casa 1', 'Vila Rica', '27283100'),
(5, 'Rua dos Pioneiros', '202', '', 'Jardim Primavera', '25030000'),
(6, 'Rua das Orquídeas', '303', 'Lote 4', 'Jardim Tropical', '26000000'),
(7, 'Rua do Sol', '404', 'Apto 302', 'Nova Esperança', '26130000'),
(8, 'Rua da Paz', '505', '', 'Bela Vista', '24445200'),
(9, 'Rua das Pedras', '606', 'Casa 20', 'Santana', '28000000'),
(10, 'Rua da Praia', '707', '', 'Costa Verde', '23900000'),
(1, 'Avenida das Palmeiras', '808', 'Apto 501', 'Floresta', '20011001'),
(2, 'Rua da Liberdade', '909', '', 'Bosque', '24346001'),
(3, 'Avenida do Povo', '1001', 'Casa 2', 'Formoso', '25685001'),
(4, 'Rua dos Sonhos', '1102', '', 'Vila Rica', '27283101'),
(5, 'Avenida da Conquista', '1203', 'Lote 5', 'Jardim Primavera', '25030001'),
(6, 'Rua da Vitória', '1304', 'Apto 303', 'Jardim Tropical', '26000001'),
(7, 'Rua do Futuro', '1405', '', 'Nova Esperança', '26130001'),
(8, 'Avenida da Esperança', '1506', 'Casa 21', 'Bela Vista', '24445201'),
(9, 'Rua dos Avanços', '1607', '', 'Santana', '28000001'),
(10, 'Avenida das Oportunidades', '1708', 'Apto 502', 'Costa Verde', '23900001'),
(1, 'Rua da Alegria', '1809', 'Casa 3', 'Centro', '20011002'),
(2, 'Avenida do Progresso', '1901', '', 'Bosque', '24346002'),
(3, 'Rua das Esperanças', '2002', 'Lote 6', 'Formoso', '25685002'),
(4, 'Avenida da Vitória', '2103', '', 'Vila Rica', '27283102'),
(5, 'Rua do Triunfo', '2204', 'Apto 304', 'Jardim Primavera', '25030002'),
(6, 'Avenida da Harmonia', '2305', '', 'Jardim Tropical', '26000002'),
(7, 'Rua da Prosperidade', '2406', 'Casa 22', 'Nova Esperança', '26130002'),
(8, 'Avenida da Felicidade', '2507', '', 'Bela Vista', '24445202'),
(9, 'Rua do Sucesso', '2608', 'Apto 503', 'Santana', '28000002'),
(10, 'Avenida das Conquistas', '2709', '', 'Costa Verde', '23900002'),
(1, 'Rua do Progresso', '2801', 'Casa 4', 'Centro', '20011003'),
(2, 'Avenida da Alegria', '2902', '', 'Bosque', '24346003'),
(3, 'Rua da Harmonia', '3003', 'Lote 7', 'Formoso', '25685003'),
(4, 'Avenida da Prosperidade', '3104', '', 'Vila Rica', '27283103'),
(5, 'Rua da Felicidade', '3205', 'Apto 305', 'Jardim Primavera', '25030003'),
(6, 'Avenida do Sucesso', '3306', 'Casa 23', 'Jardim Tropical', '26000003'),
(7, 'Rua das Conquistas', '3407', '', 'Nova Esperança', '26130003'),
(8, 'Avenida do Triunfo', '3508', 'Apto 504', 'Bela Vista', '24445203'),
(9, 'Rua da Unidade', '3609', '', 'Santana', '28000003'),
(10, 'Avenida da Prosperidade', '3701', 'Casa 24', 'Costa Verde', '23900003');

-- Criando a tabela fornecedor
create table fornecedor(
	fornecedor_id integer not null primary key AUTO_INCREMENT,
	nome varchar(64) not null unique
);


create table transportadora(
	transportadora_id integer not null primary key AUTO_INCREMENT,
	nome varchar(64) not null unique
);

create table marca(
	marca_id integer not null primary key AUTO_INCREMENT,
	nome varchar(128) not null unique
);

create table produto(
	produto_id integer not null primary key AUTO_INCREMENT,
	fornecedor_id integer not null,
	marca_id integer not null,
	nome varchar(128) not null,
	preco_custo decimal(8,2),
	preco_venda decimal(8,2),
	
	constraint fk_produto_fornecedor_id foreign key(fornecedor_id) references fornecedor(fornecedor_id),
	constraint fk_produto_marca_id foreign key(marca_id) references marca(marca_id)
);



-- | Tabela fornecedor                                    |
-- |------------------------------------------------------|
-- | fornecedor_id | nome                                 |
-- | 1             | Papel & Caneta Ltda                  |
-- | 2             | Escritório Total                     |
-- | 3             | Suprimentos Universais de Escritório |
-- | 4             | Artefatos de Escritório Requintados  |
-- | 5             | Globos de Escritório e Mais          |

insert into fornecedor(nome) values 
('Papel & Caneta Ltda'), 
('Escritório Total'), 
('Suprimentos Universais de Escritório '), 
('Artefatos de Escritório Requintados'), 
('Globos de Escritório e Mais'); 

-- | Tabela transportadora                          |
-- |------------------------------------------------|
-- | transportadora_id | nome                       |
-- | 1                 | Entrega Expressa Ltda      |
-- | 2                 | Logística Global           |
-- | 3                 | Entregas Rápidas e Seguras |
-- | 4                 | Transporte Seguro          |
-- | 5                 | Logística Padrão Ouro      |
-- | 6                 | Entrega Garantida S.A.     |

insert into transportadora (nome) values 
('Entrega Expressa Ltda'), 
('Logística Global'), 
('Entregas Rápidas e Seguras'), 
('Transporte Seguro'), 
('Logística Padrão Ouro'), 
('Entrega Garantida S.A.');


-- | Tabela marca              |
-- |---------------------------|
-- | marca_id | nome           |
-- | 1        | EscritoMáximo  |
-- | 2        | Papéis Premier |
-- | 3        | CanetaCrível   |
-- | 4        | NotaBrilhante  |

insert into marca (nome) values 
('EscritoMáximo'), 
('Papéis Premier'), 
('CanetaCrível'), 
('NotaBrilhante'); 



-- | Tabela produto                                                                                                               |
-- |------------------------------------------------------------------------------------------------------------------------------|
-- | produto_id | fornecedor_id                        | marca_id       | nome                        | preco_custo | preco_venda |
-- | 1          | Papel & Caneta Ltda                  | EscritoMáximo  | Caneta Azul                 | 0.50        | 1.00        | 
-- | 2          | Papel & Caneta Ltda                  | Papéis Premier | Pacote de Papel A4          | 3.00        | 5.00        |
-- | 3          | Escritório Total                     | CanetaCrível   | Lapiseira 0.5mm             | 1.00        | 2.00        |
-- | 4          | Escritório Total                     | NotaBrilhante  | Borracha Branca             | 0.30        | 0.60        |
-- | 5          | Suprimentos Universais de Escritório | EscritoMáximo  | Clips Coloridos             | 1.00        | 2.00        |
-- | 6          | Suprimentos Universais de Escritório | Papéis Premier | Pacote de Post-it           | 1.50        | 3.00        |
-- | 7          | Artefatos de Escritório Requintados  | CanetaCrível   | Caderno Universitário       | 4.00        | 8.00        |
-- | 8          | Artefatos de Escritório Requintados  | NotaBrilhante  | Pacote de Canetas Coloridas | 2.00        | 4.00        |
-- | 9          | Papel & Caneta Ltda                  | EscritoMáximo  | Estojo Escolar              | 5.00        | 10.00       |
-- | 10         | Papel & Caneta Ltda                  | Papéis Premier | Estojo Escolar              | 0.15        | 0.30        |
-- | 11         | Escritório Total                     | CanetaCrível   | Régua 30cm                  | 0.80        | 1.60        |
-- | 12         | Escritório Total                     | NotaBrilhante  | Apontador com Depósito      | 0.75        | 1.50        |
-- | 13         | Suprimentos Universais de Escritório | EscritoMáximo  | Pasta Catálogo              | 6.00        | 12.00       |
-- | 14         | Suprimentos Universais de Escritório | Papéis Premier | Fita Adesiva                | 1.20        | 2.40        |
-- | 15         | Artefatos de Escritório Requintados  | CanetaCrível   | Pincel Atômico              | 1.30        | 2.60        |
-- | 16         | Artefatos de Escritório Requintados  | NotaBrilhante  | Corretivo Líquido           | 2.50        | 5.00        |
-- | 17         | Papel & Caneta Ltda                  | EscritoMáximo  | Calculadora Simples         | 8.00        | 16.00       |
-- | 18         | Escritório Total                     | Papéis Premier | Grampeador Pequeno          | 4.50        | 9.00        |
-- | 19         | Suprimentos Universais de Escritório | CanetaCrível   | Caixa de Clips              | 2.00        | 4.00        |
-- | 20         | Artefatos de Escritório Requintados  | NotaBrilhante  | Resma de Papel Sulfite      | 15.00       | 30.00       |

insert into produto(fornecedor_id, marca_id, nome, preco_custo, preco_venda) values 
(1, 1, 'Caneta Azul', 0.50, 1.00), 
(1, 2, 'Pacote de Papel A4', 3.00, 5.00), 
(2, 3, 'Lapiseira 0.5mm', 1.00, 2.00), 
(2, 4, 'Borracha Branca', 0.30, 0.60), 
(3, 1, 'Clips Coloridos', 1.00, 2.00), 
(3, 2, 'Pacote de Post-it', 1.50, 3.00), 
(4, 3, 'Caderno Universitário', 4.00, 8.00), 
(4, 4, 'Pacote de Canetas Coloridas', 2.00, 4.00), 
(1, 1, 'Estojo Escolar', 5.00, 10.00), 
(1, 2, 'Estojo Escolar', 0.15, 0.30), 
(2, 3, 'Régua 30cm', 0.80, 1.60), 
(2, 4, 'Apontador com Depósito', 0.75, 1.50), 
(3, 1, 'Pasta Catálogo', 6.00, 12.00), 
(3, 2, 'Fita Adesiva', 1.20, 2.40), 
(4, 3, 'Pincel Atômico', 1.30, 2.60), 
(4, 4, 'Corretivo Líquido', 2.50, 5.00), 
(1, 1, 'Calculadora Simples', 8.00, 16.00), 
(2, 2, 'Grampeador Pequeno', 4.50, 9.00), 
(3, 3, 'Caixa de Clips', 2.00, 4.00), 
(4, 4, 'Resma de Papel Sulfite', 15.00, 30.00);


-- | Tabela pedido                                                                     |
-- |-----------------------------------------------------------------------------------|
-- | Nome do campo     | Tipo do Campo          | Restrições                           |
-- |-------------------|------------------------|--------------------------------------|
-- | pedido_id         | Integer                | Chave primária, não permite nulos    |
-- | cliente_id        | Integer                | Chave estrangeira, não permite nulos |
-- | transportadora_id | Integer                | Chave estrangeira, não permite nulos |
-- | data              | Date                   | não permite nulos                    |
-- | total             | decimal(8,2)           | não permite nulos                    |

create table pedido(
	pedido_id integer not null primary key AUTO_INCREMENT,
	cliente_id integer not null,
	transportadora_id integer not null,
	data date not null,
	total decimal(8,2) not null,
	
	constraint fk_pedido_cliente_id foreign key(cliente_id) references cliente(cliente_id),
	constraint fk_pedido_transportadora_id foreign key(transportadora_id) references transportadora(transportadora_id)
);

-- | Tabela pedido                                                                 |
-- |-------------------------------------------------------------------------------|
-- | pedido_id | cliente_id      | transportadora_id          | data       | total |
-- |-----------|-----------------|----------------------------|------------|-------|
-- | 1         | Rodrigo Campos  | Entrega Expressa Ltda      | 2023-05-12 | 0.0   |
-- | 2         | Ana             | Transporte Seguro          | 2023-05-12 | 0.0   |
-- | 3         | Rodrigo Campos  | Entrega Expressa Ltda      | 2023-05-12 | 0.0   |
-- | 4         | Pedro           | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |
-- | 5         | Pedro           | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |
-- | 6         | Luís            | Logística Global           | 2023-05-12 | 0.0   |
-- | 7         | Felipe          | Transporte Seguro          | 2023-05-12 | 0.0   |
-- | 8         | Gustavo         | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |
-- | 9         | Patricia        | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |
-- | 10        | Bruno           | Entrega Garantida S.A.     | 2023-05-12 | 0.0   |
-- | 11        | Carolina        | Entrega Expressa Ltda      | 2023-05-12 | 0.0   |
-- | 12        | Roberto         | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |
-- | 13        | Maria Barcelos  | Entrega Expressa Ltda      | 2023-05-12 | 0.0   |
-- | 14        | Roberto         | Entrega Expressa Ltda      | 2023-05-12 | 0.0   |
-- | 15        | Maria Barcelos  | Entregas Rápidas e Seguras | 2023-05-12 | 0.0   |

insert into pedido (cliente_id, transportadora_id, data, total) values 
(1, 1, '2023-05-12', 0.0),
(5, 4, '2023-05-12', 0.0),
(1, 1, '2023-05-12', 0.0),
(4, 3,  '2023-05-12', 0.0),
(4, 3, '2023-05-12', 0.0),
(6, 2, '2023-05-12', 0.0),
(8, 4, '2023-05-12', 0.0),
(14, 3, '2023-05-12', 0.0),
(11, 3, '2023-05-12', 0.0),
(10, 6, '2023-05-12', 0.0),
(7, 1, '2023-05-12', 0.0),
(12, 3, '2023-05-12', 0.0),
(3, 1, '2023-05-12', 0.0),
(12, 1, '2023-05-12', 0.0),
(3, 3, '2023-05-12', 0.0);



-- | Tabela pedido_produto                                                             |
-- |-----------------------------------------------------------------------------------|
-- | Nome do campo     | Tipo do Campo          | Restrições                           |
-- |-------------------|------------------------|--------------------------------------|
-- | pedido_produto_id | Integer                | Chave primária, não permite nulos    |
-- | pedido_id         | Integer                | Chave estrangeira, não permite nulos |
-- | produto_id        | Integer                | Chave estrangeira, não permite nulos |
-- | quantidade        | Integer                | não permite nulos                    |
-- | preco_unitario    | decimal(8,2)           | não permite nulos                    |

create table pedido_produto(
	pedido_produto_id integer not null primary key AUTO_INCREMENT,
	pedido_id integer not null,
	produto_id integer not null,
	quantidade integer not null,
	preco_unitario decimal(9,2) not null,
	
	constraint fk_pedido_pedido_id foreign key(pedido_id) references pedido(pedido_id),
	constraint fk_pedido_produto_id foreign key(produto_id) references produto(produto_id)
);


insert into pedido_produto (pedido_id, produto_id, quantidade, preco_unitario) values 
(1, 8, 6 , 4.00 ),
(1, 13 , 4 , 12.00),
(1, 7 , 6 , 8.00 ),
(1, 15 , 7 , 2.60 ),
(1, 3 , 15, 2.00 ),
(1, 3 , 9 , 2.00 ),
(2, 16 , 5 , 5.00 ),
(2, 16 , 10, 5.00 ),
(2, 4 , 5 , 0.60 ),
(2, 6 , 14, 3.00 ),
(2, 14 , 7 , 2.40 ),
(2, 1 , 14, 1.00 ),
(2, 20 , 3 , 30.00),
(2, 17 , 3 , 16.00),
(3, 7 , 3 , 8.00 ),
(3, 4 , 1 , 0.60 ),
(3, 6 , 12, 3.00 ),
(3, 13 , 15, 12.00),
(3, 5 , 7 , 2.00 ),
(4, 18 , 9 , 9.00 ),
(4, 2 , 13, 5.00 ),
(4, 4 , 8 , 0.60 ),
(4, 6 , 2 , 3.00 ),
(4, 15 , 14, 2.60 ),
(5, 17 , 5 , 16.00),
(5, 18 , 2 , 9.00 ),
(5, 5 , 6 , 2.00 ),
(5, 8, 4 , 4.00 ),
(5, 17 , 1 , 16.00),
(5, 5 , 3 , 2.00 ),
(5, 8, 5 , 4.00 ),
(5, 14 , 3 , 2.40 ),
(5, 18 , 12, 9.00 ),
(6, 20 , 7 , 30.00),
(6, 17 , 9 , 16.00),
(6, 14 , 12, 2.40 ),
(7, 3 , 12, 2.00 ),
(7, 12 , 10, 1.50 ),
(7, 17 , 7 , 16.00),
(7, 19 , 10, 4.00 ),
(8, 1 , 9 , 1.00 ),
(8, 5 , 5 , 2.00 ),
(8, 16 , 12, 5.00 ),
(8, 18 , 5 , 9.00 ),
(8, 9 , 9 , 0.30 ),
(8, 12 , 7 , 1.50 ),
(8, 18 , 5 , 9.00 ),
(8, 12 , 8 , 1.50 ),
(9, 2 , 4 , 5.00 ),
(9, 5 , 10, 2.00 ),
(9, 11 , 9 , 1.60 ),
(9, 6 , 14, 3.00 ),
(10, 16 , 2 , 5.00 ),
(10, 8, 8 , 4.00 ),
(11, 6 , 12, 3.00 ),
(11, 4 , 9 , 0.60 ),
(11, 13 , 15, 12.00),
(11, 13 , 13, 12.00),
(11, 15 , 15, 2.60 ),
(11, 16 , 6 , 5.00 ),
(11, 4 , 3 , 0.60 ),
(12, 12, 9 , 1.50 ),
(12, 8, 3 , 4.00 ),
(12, 7, 4 , 8.00 ),
(12, 16 , 6 , 5.00 ),
(13, 7, 2 , 8.00 ),
(13, 14 , 13, 2.40 ),
(13, 7, 11, 8.00 ),
(14, 19 , 8 , 4.00 ),
(14, 12, 7 , 1.50 ),
(14, 9 , 3 , 10.00),
(14, 19 , 8 , 4.00 ),
(14, 15 , 6 , 2.60 ),
(15, 15 , 7 , 2.60 ),
(15, 17 , 2 , 16.00),
(15, 3 , 2 , 2.00 ),
(15, 14 , 8 , 2.40 ),
(15, 18 , 3 , 9.00 ),
(15, 20, 1 , 30.00),
(15, 3 , 5 , 2.00 );




create table cliente_endereco(
	cliente_endereco_id integer not null primary key AUTO_INCREMENT,
	cliente_id integer not null,
	endereco_id integer not null,
	descricao varchar(64),
	isPrincipal boolean default true,
	
	constraint fk_cliente_endereco_cliente_id foreign key(cliente_id) references cliente(cliente_id), 
	constraint fk_cliente_endereco_endereco_id foreign key(endereco_id) references endereco(endereco_id)
);


insert into cliente_endereco(cliente_id, endereco_id, descricao, isPrincipal) values 
(1, 1, 'Residência', true);

insert into cliente_endereco(cliente_id, endereco_id, descricao, isPrincipal) values 
(1, 15, 'Escritório', false);

insert into cliente_endereco(cliente_id, endereco_id, descricao, isPrincipal) values 
(1, 16, 'Casa na praia', false);

insert into cliente_endereco(cliente_id, endereco_id, descricao, isPrincipal) values 
(15, 17, 'Residência', true);

insert into cliente_endereco(cliente_id, endereco_id, descricao, isPrincipal) values 
(10, 10, 'Residência', true);

SET @string_lf = '000000000001Rodrigo Campos                          000000000000012319800125VeganPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR';
SELECT @string_lf AS largura_fixa;

select 
	-- @string_lf as original,
	substring(@string_lf from 1 for 12) as "cliente_id",
    substring(@string_lf from 13 for 40) as "nome",
    substring(@string_lf from 53 for 16) as "cpf",
    substring(@string_lf from 69 for 8), '%Y%m%d') as "data_nascimento",
    substring(@string_lf from 77 for 40), 'P', '') as "observacao",
    substring(@string_lf from 127), 'R', '')  as "vazio"



cliente_id = 12
nome = 20
cpf = 16
data_nacimento = 8
observacoes = 40
vazios = resto;

select instr(@string_lf, ' ') as posicao_espaco;

select 
substring_index(nome,' ',1) as primeiro_nome
from cliente;

