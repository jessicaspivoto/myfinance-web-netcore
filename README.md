# myfinance-web-netcore
O aplicativo foi desenvolvido com o objetivo de facilitar o controle financeiro.

# DER - Diagrama de Entidade e Relacionamento
<img src="docs/DER.PNG">

# Build 
``dotnet build``

# Run 
``dotnet watch run``


# Plano de Contas
É permitido, por requisito funcional, que o usuário cadastre um plano de contas, bem como a visualização dos planos de contas existentes. Informações como id, descrição e tipo, que podem ser Despesas ou Receitas, podem ser visualizadas. O usuário também tem a possibilidade de editar um plano de contas ou removê-lo através dos botões correspondentes.
<img src="docs/CriarItemPlanoDeConta.PNG">
<img src="docs/PlanoDeContas.PNG">

# Transações
É permitido através de um requisito funcional que o usuário registre uma transação, bem como visualize as transações existentes. Podem ser visualizadas informações como id, data, descrição, valor, tipo de operação que pode ser Despesa ou Receita, e o Plano de Conta ao qual está vinculado. O usuário também tem a possibilidade de editar uma transação financeira ou removê-la através dos botões correspondentes.
<img src="docs/RegistrarTransacaoFinanceira.PNG">
<img src="docs/TransacoesFinanceiras.PNG">

# Método de Pagamento
É permitido através de um requisito funcional extra que o usuário indique o tipo de pagamento quando a transação for uma "Despesa". O aplicativo deve permitir a seleção das seguintes modalidades: Dinheiro, Débito, Pix, Crédito e Boleto.

~~~sql
1- Criar uma nova tabela:

 create table metodopagamento(
    id int identity(1,1) not null,
    tipo varchar(50) not null,
  );


2- Popular com os tipos: Dinheiro, Crédito, Débito, Pix e Boleto.

 insert into metodopagamento
    (tipo)
    values
      ('Dinheiro'),
      ('Crédito'),
      ('Débito'),
      ('Pix'),
      ('Boleto'),

3- Criar uma FK dentro da nova tabela e apontar para "metodoPagamento(Id)"

  ALTER TABLE transacao
  ADD metodopagamentoid INT
  REFERENCES metodopagamento(id);


