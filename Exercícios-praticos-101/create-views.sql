create table if not exists funcionarios (
	id serial,
	nome varchar(50),
	gerente integer,
	primary key (id),
	foreign key(gerente) references funcionarios(id)
);

insert into funcionarios(nome, gerente) values ('Anselmo', null);
insert into funcionarios(nome, gerente) values ('Luana', 1);
insert into funcionarios(nome, gerente) values ('Tiago', 1);
insert into funcionarios(nome, gerente) values ('Maria', 2);
insert into funcionarios(nome, gerente) values ('Fernando', 4);

select id, nome, gerente from funcionarios where gerente is null
union all
select id, nome, gerente from funcionarios where id = 99 -- exemplo

create or replace recursive view vw_funcionarios(id, gerente, funcionario_nome) as
( 
	select id, gerente, nome
	from funcionarios
	where gerente is null
	union all
	select fu.id, fu.gerente, fu.nome 
	from funcionarios as fu
	join vw_funcionarios on vw_funcionarios.id = fu.gerente
);

select id, gerente, funcionario_nome from vw_funcionarios;