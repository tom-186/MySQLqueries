/*
creare un database "concessionaria" con le tabelle:
clienti (id, nome, cognome, etc.)
auto (id, id_cliente, targa, km, descrizione, costo)

inserie qualche riga di dati
fare qualche query select o update

*/

use concessionaria

insert into clienti (cognome, nome, telefono, email)
values ('Nocentini', 'Alessio', '3475463215','alenoce@gmail.com'),
	   ('Sorelli', 'Marco', '3485446215','soremarco@gmail.com')

select * from clienti

update clienti set email = 'ross@yahoo.it' where id=4

-- problema di escape delle stringhe
update clienti set cognome = 'D''Alessandro' where id=5

delete from clienti where id = 4

insert into auto (id_cliente, targa, km, descrizione, costo)
values (2,'AG648VB', 90000, 'Ottimo affare', 12000) 

select * from auto

--aggiungere una colonna ad una tabella
alter table auto add colore nvarchar(50) null

-- cambiare le proprietà di una colonna
alter table auto alter column id_cliente bigint not null

update auto set modello = 'Fiat 500', colore = 'nero' where id =1

insert into auto (id_cliente, targa, km, descrizione, costo, modello, colore)
values (2,'HN556OK', 1000, 'Occasione imperdibile', 15000, 'Ford Fiesta', 'verde') 

-- select con filtri
select * from auto where costo<10000

select * from auto where costo<10000 and km<50000

select * from auto
select * from clienti

--join
select nome, cognome, telefono, km, costo, descrizione, modello,
colore from auto 
inner join clienti on (id_cliente = clienti.id)
where costo<10000 and km<50000

