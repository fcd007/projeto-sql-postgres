CREATE ROLE professores NOCREATEDB NOCREATEROLE INHERIT NOLOGIN NOBYPASSRLS CONNECTION LIMIT 10;
ALTER ROLE professores PASSWORD '123';
