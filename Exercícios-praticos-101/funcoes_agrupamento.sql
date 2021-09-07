SELECT NUMERO, NOME FROM BANCO;
SELECT BANCO_NUMERO, NUMERO, NOME FROM AGENCIA;
SELECT NUMERO, NOME, EMAIL FROM CLIENTE;
SELECT BANCO_NUMERO, AGENCIA_NUMERO, CLIENTE_NUMERO FROM cliente_transacoes;

SELECT * FROM CONTA_CORRENTE WHERE 1=0
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'banco';
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME ='banco';

--funções de agrupamento 
--avg 
--count (having)
--max
--min
--sum
select * from cliente_transacoes;

select avg(valor) from cliente_transacoes;
select count (numero) from cliente;
select count(numero) as quantidade, email from cliente where email ilike '%gmail.com' group by email;
select max(numero) from cliente;
select min(numero) from cliente;
select min(valor) from cliente_transacoes;
select max(valor) from cliente_transacoes;

select max(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id;
select min(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id;

select count(id), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id
having count(id) > 150;

select sum(valor) from cliente_transacoes;
select sum(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id;

--order by - padrão asc
select sum(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id 
order by tipo_transacao_id; 
--mudando para desc
select sum(valor), tipo_transacao_id from cliente_transacoes group by tipo_transacao_id 
order by tipo_transacao_id desc; --padrão desc
