
create database cielo;

create domain PosInteger as integer 
    check (value >= 0);

create domain StringaM as varchar(100);
create domain CodIATA as char(3);

create table Volo (
    codice PosInteger not null,
    comp StringaM not null,
    durataMinuti PosInteger not null,

    primary key (codice, comp)
);

create table ArrPart (
    codice PosInteger primary key,
    comp stringaM not null,
    arrivo CodIATA not null,
    partenza CodIATA not null

);

create table Aereoporto (
    codice CodIATA not null,
    nome StringaM not null

    primary key (codice)
);

create table LuogoAereoporto (
    aereoporto CodIATA not null,
    citta StringaM not null,
    nazione StringaM not null,

    primary key (aereoporto)

);

create table Compagnia (
    nome StringaM primary key,
    annoFondaz PosInteger

);


alter table Volo add foreign key 
(comp) references Compagnia(nome);
alter table Volo add foreign key
(codice, comp) references ArrPart(codice, comp);

alter table ArrPart add foreign key
(codice, comp) references Volo(codice, comp);
alter table ArrPart add foreign key
(arrivo) references Aereoporto(codice);
alter table ArrPart add foreign key
(partenza) references Aereoporto(codice);

alter table Aereoporto add foreign key
(codice) references Aereoporto(codice);

alter table LuogoAereoporto add foreign key
(aereoporto) references Aereoporto(codice);

commit;
