CREATE DATABASE myfinance

use myfinance

create table planoconta(
	id int identity(1,1) not null,
	descricao varchar(50) not null,
	tipo char(1) not null,
	primary key (id)
);

create table transacao(
	id int identity(1,1) not null,
	data datetime not null,
	valor decimal(9,2),
	historico text,
	planocontaid int not null,
	primary key(id),
	foreign key(planocontaid) references planoconta(id)
);

create table metodopagamento(
    id int identity(1,1) not null,
    tipo varchar(50) not null,
);

ALTER TABLE transacao
	ADD metodopagamentoid INT
	REFERENCES metodopagamento(id);

truncate table transacao
alter table transacao add constraint pk_transacao_id primary key(id) 
  
SELECT * FROM planoconta
SELECT * FROM transacao

insert into planoconta(descricao, tipo)
values('Dividendos de A��es', 'R')

insert into planoconta(descricao, tipo)
values('Sal�rio', 'R')

insert into planoconta(descricao, tipo)
values('Combust�vel', 'D')

insert into transacao(data, valor, historico, planocontaid)
values('20230215 07:00', 10.50, 'Americanas', 2)

insert into transacao(data, valor, historico, planocontaid)
values('20230205 07:00', 345.67, 'Gasolina Blazer', 2)

insert into metodopagamento(tipo)
values('Dinheiro'),
    ('Cr�dito'),
    ('D�bito'),
    ('Pix'),
    ('Boleto'),

--Todas as transa��es de Despesas no m�s de janeiro
select t.data, t.valor, p.descricao 
	from transacao t
	inner join planoconta p on t.planocontaid = p.id
	where p.tipo = 'D' and t.data >='20230101' and t.data <='20230131'

--Todas as transa��es maiores que 200 reais 
select * from transacao where valor > 200

--Somatorio de transa��es de receitas e despesas de todo o periodo
select 
	d.total_despesas, 
	r.total_receitas 
from
	(select sum(valor) as total_despesas 
	from transacao t join planoconta p on p.id = t.planocontaid
	where p.tipo = 'D') as d,
	(select sum(valor) as total_receitas 
	from transacao t join planoconta p on p.id = t.planocontaid
	where p.tipo = 'R') as r
	
--M�dia de transa��es por m�s
select 
avg(valor) as media, 
month(data) as mes
from transacao
group by month(data)

select year(getdate())

--Transa��es e seus itens de plano de contas
select t.id, t.data, t.valor, p.descricao, p.tipo
from transacao t join planoconta p 
on t.planocontaid = p.id

--SQL
--DQL - Data Query Language (SELECT)
--DML - Data Manipulation Language (INSERT, UPDATE, DELETE)
--DDL - Data Definition Language (CREATE, ALTER, DROP)
--DCL - Data Create Language (GRANT, REVOKE)
--DTL - Data Transaction Language (BEGIN, COMMIT, ROLLBACK)

