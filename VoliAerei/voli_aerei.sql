

create database voli_aerei 

--domini
create domain IntGZ as integer check(value > 0);
create domain IntGEZ as integer check(value >= 0);
create domain IntG1900 as integer check(value > 1900);

--tabelle
create table Volo (
    codice varchar(10) primary key,
    durata IntGZ not null
);

create table CompagniaAerea (
    nome varchar(100) primary key,
    fondazione IntG1900 not null
);

create table Nazione (
    nome varchar primary key
);

create table Citta (
    nome varchar(100) not null,
    abitanti IntGEZ not null,
    Nazione varchar(100) not null,

    primary key (nome, Nazione),
    foreign key (Nazione) references Nazione(nome)
);

create table Aereoporto (
    codice varchar(100) primary key,
    nome varchar(100)
);

--associazioni

create table Partenza (
    Volo varchar(10) not null,
    Aereoporto varchar(100) not null,

    primary key (Volo, Aereoporto),
    foreign key (volo) references Volo(codice),
    foreign key (Aereoporto) references Aereoporto(codice)
);

create table Arrivo (
    Volo varchar(10) not null,
    Aereoporto varchar(100) not null,

    primary key (Volo, Aereoporto),
    foreign key (Volo) references Volo(codice),
    foreign key (Aereoporto) references Aereoporto(codice)
);

create table Volo_comp (
    Volo varchar(10) not null,
    CompagniaAerea varchar(100) not null,

    primary key (Volo),
    foreign key (Volo) references Volo(codice),
    foreign key (CompagniaAerea) references CompagniaAerea(nome)
);

create table Comp_direzione_citta (
    CompagniaAerea varchar(100) not null,
    Citta varchar(100) not null,
    Nazione varchar not null,

    primary key (CompagniaAerea),
    foreign key (CompagniaAerea) references CompagniaAerea(nome),
    foreign key (Citta, Nazione) references Citta(nome, nazione)

);

create table Aereoporto_citta (
    Aereoporto varchar(100),
    Citta varchar(100),
    Nazione varchar

    primary key (Aereoporto, Citta),
    foreign key (Aereoporto) references Aereoporto(nome),
    foreign key (Citta, Nazione) references Citta(nome, Nazione)
);

commit;
