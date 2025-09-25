create type Strutturato as enum ('Ricercatore', 'Professore Associato', 'Professore Ordinario');
 
create type LavoroProgetto as enum ('Ricerca e Sviluppo', 'Dimostrazione', 'Management', 'Altro');
 
create type LavoroNonProgettuale as enum ('Didattica', 'Ricerca', 'Missione', 'Incontro Dipartimentale', 'Incontro Accademico', 'Altro');
 
create type CausaAssenza as enum ('Chiusura Universitaria', 'Maternita', 'Malattia');
 
-- Domini
create domain PosInteger as integer
   default 0
   check (value >= 0);
 
create domain StringaM as varchar(100);
 
create domain NumeroOre as integer
   default 0
   check (value >= 0 and value <= 8);
 
create domain Denaro as integer
   check (value >= 0);
 
-- Tabelle
create table Persona (
    id PosInteger primary key,
    nome StringaM,
    cognome StringaM,
    posizione Strutturato,
    stipendio Denaro
);
 
create table Progetto (
    id PosInteger primary key,
    nome StringaM not null unique,
    inizio date not null,
    fine date not null,
    budget Denaro not null,
    check (inizio < fine)
);
 
create table WP (
    id PosInteger,
    progetto PosInteger,
    nome StringaM not null,
    inizio date not null,
    fine date not null,
    primary key (progetto,id),
    unique (progetto, nome),
    check (inizio < fine),
    foreign key (progetto) references Progetto(id)
);
 
create table AttivitaProgetto (
    progetto PosInteger,
    id PosInteger,
    persona PosInteger not null,
    wp PosInteger not null,
    giorno date not null,
    tipo LavoroProgetto not null,
    oreDurata NumeroOre not null,
    primary key (progetto, id),
    foreign key (persona) references Persona(id),
    foreign key (progetto, wp) references WP(progetto, id)
);
 
create table AttivitaNonProgettuale (
    id PosInteger primary key,
    persona PosInteger not null,
    tipo LavoroNonProgettuale not null,
    giorno date not null,
    oreDurata NumeroOre not null,
    foreign key (persona) references Persona(id)
);
 
create table Assenza (
    id PosInteger primary key,
    persona PosInteger not null,
    tipo CausaAssenza not null,
    giorno date not null,
    unique (persona, giorno),
    foreign key (persona) references Persona(id)
);
 
