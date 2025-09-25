

-- Domini
 
create domain Stringa as varchar(100);
 
create domain Denaro as char(3)
   check (value >= 0);
 
-- Tabelle
create table Impiegato (
    nome Stringa not null,
    cognome Stringa not null,
    dataNascita data,
    stipendio Denaro not null

    primary key (nome, cognome)
);

create table Progetto (
    nome Stringa primary key,
    budget Denaro not null
);

create table Dipartimento (
    nome Stringa primary key,
    telefono Stringa
);

create table Partecipa (
    Impiegato Stringa not null,
    Progetto Stringa not null,

    primary key (Impiegato, Progetto)
    foreign key (Impiegato) references Impiegato(nome),
    foreign key (Progetto) references Progetto(nome)
);

create table Afferisce (
    Impiegato Stringa not null,
    Dipartimento Stringa not null,
    dataAfferenza data not null,

    primary key (Impiegato, Dipartimento),
    foreign key (Dipartimento) references Dipartimento(nome),
    foreign key (Impiegato) references Impiegato(nome, cognome)
);

create table Dirige (
    Impiegato Stringa not null,
    Dipartimento Stringa not null,

    primary key (Dipartimento) references Dipartimento(nome)
    foreign key (Impiegato) references Impiegato(nome)  
);

commit;