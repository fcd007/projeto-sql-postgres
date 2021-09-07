select numero, nome, ativo
from banco;

create or replace view vw_bancos as (
	select nome, numero, ativo from banco
);
-- consulta na view
select numero, nome, ativo from vw_bancos;

create or replace view vw_bancos2 (banco_numero, banco_nome, banco_Ativo) as (
select numero, nome, ativo from banco
)

select banco_numero, banco_nome, banco_ativo from vw_bancos2 where banco_numero = 51;
select numero, nome, ativo from banco where numero = 51;

update vw_bancos2 set banco_ativo = false where banco_numero = 51
insert into vw_bancos2 (banco_numero, banco_nome, banco_ativo) values
delete from vw_bancos2 where banco_numero = 51;
(51,'Banco boa Ideia', TRUE);

--view temporária
create or replace temporary view vw_agencia as (
select nome from agencia
)

select nome from vw_agencia;

create or replace view vw_bancos_ativos as (
	select numero, nome, ativo
	from banco
	where ativo is true
); --with local check option

-- inserir 
insert into vw_bancos_ativos (numero, nome, ativo) values (
	51, 'Banco Jails', false
)

create or replace view vw_bancos_com_a as (
	select numero, nome, ativo
	from vw_bancos_ativos
	where nome ilike 'a%'
) with cascaded check option;

select numero, nome, ativo from vw_bancos_com_a;
insert into vw_bancos_com_a (numero, nome, ativo) values
(333, 'Alion Bank Club', true);

insert into vw_bancos_com_a (numero, nome, ativo) values
(331, 'Atio-Bank Club Power', false);
--error validate views
insert into vw_bancos_com_a (numero, nome, ativo) values
(332, 'Ah-Bank Jails', false);