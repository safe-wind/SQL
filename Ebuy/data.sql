INSERT INTO Categoria (nome, super) VALUES
('Elettronica', NULL),
('Smartphone', 'Elettronica'),
('Computer', 'Elettronica'),
('Casa', NULL),
('Arredamento', 'Casa');

INSERT INTO MetodoPagamento (nome) VALUES
('PayPal'),
('Carta di Credito'),
('Bonifico'),
('BitCoin');

INSERT INTO Utente (username, registrazione) VALUES
('mario', '2023-01-10 09:00:00'),
('anna', '2023-02-14 12:30:00'),
('luca', '2023-03-01 15:45:00'),
('giulia', '2023-03-20 08:00:00');

INSERT INTO Privato (utente) VALUES
('mario'),
('anna');

INSERT INTO VenditoreProf (utente, vetrina) VALUES
('luca', 'http://vetrina-luca.it'),
('giulia', 'http://giulia-shop.com');

INSERT INTO PostOggetto (id, pubblica, descrizione, pubblicazione, ha_feedback, voto, commento, istante_feedback, categoria)
VALUES
(1, 'mario', 'iPhone 11 usato in ottime condizioni', '2023-04-01 10:00:00', TRUE, 5, 'Perfetto acquisto!', '2023-04-02 11:00:00', 'Smartphone'),
(2, 'luca', 'Laptop HP nuovo, 16GB RAM', '2023-04-05 14:00:00', FALSE, NULL, NULL, NULL, 'Computer'),
(3, 'giulia', 'Divano moderno 3 posti', '2023-04-07 09:30:00', TRUE, 4, 'Comodo ma consegna lenta', '2023-04-10 18:00:00', 'Arredamento');

INSERT INTO PostOggettoNuovo (postoggetto, anni_garanzia, pubblica_nuovo)
VALUES
(2, 2, 'luca');

INSERT INTO met_post (postoggetto, metodo) VALUES
(1, 'PayPal'),
(1, 'BitCoin'),
(2, 'Carta di Credito'),
(3, 'Bonifico');

INSERT INTO CompraloSubito (post, prezzo, privato, istante_acq)
VALUES
(1, 350.00, 'anna', '2023-04-03 16:00:00'),
(3, 700.00, NULL, NULL); -- ancora disponibile

INSERT INTO Asta (post, prezzo_bid, scadenza, prezzo_base)
VALUES
(2, 500.00, '2023-04-15 20:00:00', 450.00);

INSERT INTO Bid (codice, asta, istante, privato) VALUES
(DEFAULT, 2, '2023-04-06 12:00:00', 'mario'),
(DEFAULT, 2, '2023-04-07 12:30:00', 'anna');

INSERT INTO OggettoUsato (post, condizione, anni_garanzia)
VALUES
(1, 'Ottimo', 0);