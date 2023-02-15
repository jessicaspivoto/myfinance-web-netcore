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

SELECT * FROM planoconta

insert into planoconta(descricao, tipo)
values('Dividendos de Acoes', 'R')

insert into transacao(data, valor, historico, planocontaid)
values('20230215 07:00', 10.50, 'Americanas', 6)

SELECT * FROM transacao

--Todas as transacoes de Despesas no mes de janeiro
select t.data, t.valor, p.descricao 
from transacao t
inner join planoconta p on t.planocontaid = p.id
where p.tipo = 'D' and t.data >='20230101' and t.data <='20230131'

--Todas as transacoes maiores que 200 reais 
select * from transacao where valor > 200

--Somatorio de transacoes de receitas e despesas de todo o periodo
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
	
--Media de transacoes por mes
select 
avg(valor) as media, 
month(data) as mes
from transacao
group by month(data)

select year(getdate())

--Transacoes e seus itens de plano de contas
select t.id, t.data, t.valor, p.descricao, p.tipo
from transacao t join planoconta p 
on t.planocontaid = p.id

--SQL
--DQL - Data Query Language (SELECT)
--DML - Data Manipulation Language (INSERT, UPDATE, DELETE)
--DDL - Data Definition Language (CREATE, ALTER, DROP)
--DCL - Data Create Language (GRANT, REVOKE)
--DTL - Data Transaction Language (BEGIN, COMMIT, ROLLBACK)