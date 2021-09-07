create or replace function func_somar(integer, integer)
returns integer
security definer
--returns null on null input
called on null input
language sql
as $$
	select coalesce($1,0) + coalesce($2,0);
$$;


select func_somar(1,3);
--select coalesce(null, 'Daniel');

-----------------------------------------------------
create or replace function bancos_add(p_numero integer,  p_nome varchar, p_ativo boolean)
returns integer
security invoker
language PLPGSQL
called on null input
as $$
declare variavel_id integer;
begin
	select into variavel_id numero
	from banco
	where numero = p_numero;
	
	return variavel_id;
end $$;

select bancos_add(5432, 'Banco Safra', false);