
use master;
create database revisioni_dispositivi;


use revisioni_dispositivi
create table aziende
(
id int identity(1,1) not null,
ragione_sociale varchar(50) null,
cap nvarchar(5) null,
citta nvarchar (50) null,
indirizzo nvarchar(50) null,
email nvarchar (50) not null unique,
primary key clustered 
(id asc)
)

create table dispositivi
(
id int identity(1,1) not null,
id_azienda int not null,
nome nvarchar(50),
data_acquisto date not null,
scheda_tecnica text,
periodicita_manutenzione int not null,
dismesso bit,
primary key clustered 
(id asc)
)


create table revisori
(
id int identity(1,1) not null,
nome nvarchar(50),
cognome nvarchar(50),
cap nvarchar(5) null,
citta nvarchar (50) null,
indirizzo nvarchar(50) null,
email nvarchar (50) not null unique,
telefono nvarchar(50) null,
partita_iva nvarchar(50) null,
primary key clustered 
(id asc)
)


create table revisioni
(
id int identity(1,1) not null,
id_dispositivo int not null,
id_revisore int not null,
data_revisione date not null,
note text,
esito_revisione bit not null,
primary key clustered 
(id asc)
)

use revisioni_dispositivi
ALTER TABLE dispositivi
   ADD CONSTRAINT FK_dispositivi_aziende FOREIGN KEY (id_azienda)
      REFERENCES aziende (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE;

ALTER TABLE revisioni
   ADD CONSTRAINT FK_revisioni_dispositivi FOREIGN KEY (id_dispositivo)
      REFERENCES dispositivi (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE

ALTER TABLE revisioni
   ADD CONSTRAINT FK_revisioni_revisore FOREIGN KEY (id_revisore)
      REFERENCES revisori (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE



