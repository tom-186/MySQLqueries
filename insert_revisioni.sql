use revisioni_dispositivi
insert into aziende (ragione_sociale, email)
values ('Moretti Srl', 'info@morettisrl.com'),
('Mani in pasta Snc', 'maniinpasta@gmail.com'),
('NFG Spa', 'amministrazione@nfgspa.com')

insert into dispositivi (id_azienda, data_acquisto, periodicita_manutenzione )
values (2, '10/12/2020', 60),
	   (1, '25/11/2020', 60),
	   (2, '5/10/2020', 90)

insert into revisori (telefono, email )
values (3474738265, 'giovanni_mv@gmail.com'),
		(3865462154, 'mario345@yahoo.it'),
		(3284755234, 'monti_carlo@vigilio.it'),
		(3339834266, 'sara.bianchi@gmail.com')

insert into revisioni (id_dispositivo, id_revisore, data_revisione, esito_revisione )
values (1, 3, '18/11/2020', 1 ),
	   (3, 1, '7/12/2020', 0 ),
	   (2, 2, '26/10/2020', 1 ),
	   (2, 4, '7/09/2020', 1 ),
	   (3, 3, '18/12/2020', 0 )

select * from aziende
select * from dispositivi
select * from revisori
select * from revisioni

update revisioni set data_revisione = '7/09/2020' where id_revisore = 5


-- esercizio (1)

select  esito_revisione, revisioni.id_revisore, revisori.nome, revisori.cognome, dispositivi.nome as nomeDispositivo,
revisori.telefono, revisioni.data_revisione
from revisioni
inner join revisori on (revisori.id = revisioni.id_revisore)
inner join dispositivi on (dispositivi.id = id_dispositivo)
where esito_revisione = 0

-- esercizio (2)

declare @d date = '2020/02/25'
select DATEADD(DAY, 30, @d) 

select id_dispositivo, periodicita_manutenzione 
from revisioni
inner join dispositivi on (dispositivi.id = revisioni.id_dispositivo )


where (getdate() > max

select max(data_revisione) from revisioni
group by id_dispositivo