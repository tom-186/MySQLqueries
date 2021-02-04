/*
CREATE INDEX indice_citta ON clienti (citta)

SET QUOTED_IDENTIFIER OFF -- impostando questo parametro con OFF, si accettano le stringhe delimitate da " 

select * from clienti where citta = "Firenze"
*/

/*
-- variabili in SQL (utilizzando T-SQL) 

declare @nomeCliente nvarchar(50)
set @nomeCliente = 'Gianni'

--posso anche assegnare nella dichiarazione
declare @cognomeCliente nvarchar(50) = 'Rossi'

-- select @nomeCliente as Nome, @cognomeCliente as Cognome 

declare @eta int = 16

select @nomeCliente + ' ' + @cognomeCliente

if (@eta >= 18)
select @nomeCliente + ' ha ' + convert(nvarchar(10), @eta) + ' anni, quindi è maggiorenne' 
else
select @nomeCliente + ' ha ' + convert(nvarchar(10), @eta) + ' anni, quindi è minorenne' 
*/

-- prova di carico (rand restituisce un numero casuale tra 0 e 1)
-- select convert(decimal(8,2), rand() * 1001)

/*
declare @n int=1

while(@n<=10)
begin 
	print @n
	set @n = @n + 1
end
*/

declare @n int=11
declare @codice varchar(20)
declare @costo decimal(8,2)
declare @descr varchar(255)

while(@n<=1000)
begin
	set @codice = 'B00' + convert(varchar, @n)
	set @costo = convert(decimal(8,2), rand() * 1001)
	set @descr = 'Descrizione articolo_' + convert(varchar, @n)
	insert into articoli (codice, costo, descrizione, iva, giacenza)
	values (@codice, @costo, @descr, 22, 300)
	print 'Inserito articolo '+ @descr
	set @n = @n + 1
end

select *, (costo + (costo*iva/100)) as costo_con_iva from articoli order by id desc

select count(*) from articoli

select sum(costo*giacenza) from articoli

select avg(costo) from articoli -- calcolo la media dei costi

-- join tra carrello, clienti e articoli
select nome, cognome, descrizione, costo, iva, (costo + (costo*iva/100))*qta as costo_totale_con_iva, qta
  from carrello
  inner join clienti on (clienti.id = carrello.id_cliente)
  inner join articoli on (articoli.id = id_articolo)	


/* 
Inserisci 3000 record di clienti con i campi:

nome_1, cognome_1, indirizzo_1, citta_1, 
per l'email info@nome_1.cognome_1.com 
per il cap creare una stringa sempre di cinque caratteri
declare @nc int = len(convert(varchar, @n))
declare @cap as varchar(5) = replicate ('0', 5-@nc) + convert(varchar, @n)
select @cap

per la password nome_1cognome_1_1
*/

declare @n int = 1
declare @nome nvarchar(50)
declare @cognome nvarchar(50)
declare @ind nvarchar(50)
declare @cap varchar(5)
declare @citta nvarchar(50)
declare @email nvarchar(50)
declare @pwd nvarchar(50)

while(@n<=1000)
begin
	declare @nc int = len(convert(varchar, @n))	
	set @nome = 'nome_' + convert(varchar, @n)
	set @cognome = 'cognome_' + convert(varchar, @n)
	set @ind = 'indirizzo_' + convert(varchar, @n)
	set @cap = replicate ('0', 5-@nc) + convert(varchar, @n)
	set @citta = 'citta_' + convert(varchar, @n)
	set @email = 'info@'+ @nome+'.'+@cognome+ '.com'
	set @pwd = @nome + @cognome +'_'+ convert(varchar, @n)
	insert into clienti (nome, cognome, indirizzo, cap, citta, email, password)
	values (@nome, @cognome, @ind, @cap, @citta, @email, @pwd)
	--print @nome + ' ' + @cap + ' ' + @email + ' '+ @pwd
	set @n = @n + 1
end

-- assegnare la stringa 'Arezzo' a citta e '52100' a cap a tutti i record con id compreso tra 100 e 300 

update clienti set cap='52100', citta = 'Arezzo' 
where id>=100 and id<=300


select * from clienti order by id

-- copiare colonne in una nuova tabella
drop table temp
select nome, cognome, email, citta
into temp
from clienti 

-- come usare il LIKE
select * from clienti where cognome like 'R%' --cognomi che iniziano per R
select * from clienti where cap like '52%' -- cap che iniziano per 52


set quoted_identifier on /*(con off permettte di accettare valori tra "")*/

select * from clienti where citta = 'Firenze'

-- inserimento record
insert into clienti (nome, cognome, indirizzo, cap, citta, email, password)
values
('Antonella', 'Verdi', 'Via del Sole, 67', '50100', 'Firenze', 'anto45@gmail.com', 'anto56'),
('Sandro', 'Cerchi', 'Via Roma, 56', '52100', 'Arezzo', 'sancerch@gmail.com', 'sc67')

/*
	modifica record
	ricordiamoci di usare il  filtro per individuare la/le righe di dati
	(record) su cui vogliamo agire
*/

update clienti set indirizzo = 'Via Napoli, 8' where id=2

update clienti set cap='50100', citta = 'Firenze' where id=2

select * from articoli

select * from carrello

insert into carrello (id_cliente, id_articolo, qta)
values
(3, 2, 1),
(1, 3, 4),
(1, 1, 1)

-- creazione di una tabella con select

select id, id_cliente, id_articolo, qta
	into provacarrello
	from carrello

delete clienti where id=2
