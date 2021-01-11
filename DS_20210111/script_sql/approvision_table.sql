use aeroport;

-- Sexe

insert into t_sexe (sex_genre) values
('Masculin'), ('Feminin'), (' - ');

-- Postes

insert into t_postes (post_intitule) values
('commandant de bord'),
('co-pilote'),
('hotesses'),
('stewards');

-- Type de vol

insert into t_types_vol (typv_description) values
('Commercial'),
('Sanitaire'),
('Cargo');

-- Statut

insert into t_statut (sta_description) values
(' '),
('embarquement en cours'),
('embarquement terminé'),
("à l'heure"),
('en retard'), 
("à l'approche");

-- Compagnie 

insert into t_compagnie (comp_code_OACI, comp_name, comp_pays) values
('AAF' , 'Aigle Azur', 4),
('GUY' , 'Air Antilles', 20),
('REU' , 'Air Austral', 11),
('FWI' , 'Air Caraïbes', 45),
('CCM' , 'Air Corsica', 54),
('AFR' , 'Air France', 75),
('VTA' , 'Air Tahiti', 200),
('CRL' , 'Corsair', 55),
('HOP' , 'Air France Hop', 75),
('TVF' , 'Transavia France', 75),
('XLF' , 'XL Airways', 100),
('EIN' , 'Aer Lingus', 150),
('JZA' , 'Jazz Aviation', 154),
('TRS' , 'AirTran Airways', 147),
('BAW' , 'British Airways', 110),
('HDA' , 'Cathay Dragon', 99),
('CAL' , 'China Airlines', 88),
('JDI' , 'Jet Story', 65),
('PAA' , 'Pan Am', 74),
('RPA' , 'Republic Airlines', 46),
('SAA' , 'South African Airlines', 230),
('VKG' , 'Thomas Cook Airlines', 241),
('LOF' , 'Trans States Airlines', 54),
('USA' , 'US Airways', 200),
('VRD' , 'Virgin America', 231),
('VOZ' , 'Virgin Australia', 196);

-- Terminal

insert into t_terminal (term_id, term_code, term_description) values
(1, 'A1', 'vol nationnal'),
(2, 'A2', 'vol nationnal'),
(3, 'A3', 'vol europeen'),
(4, 'A4', 'vol europeen'),
(5, 'B1', 'vol internnationnal'),
(6, 'B2', 'vol internnationnal'),
(7, 'B3', 'vol internnationnal'),
(8, 'B4', 'vol internnationnal');

-- Types d'avion 

insert into t_types_avion (typa_id, typa_immatriculation, typa_constructeur, typa_modele, typa_nb_place) values
(1, 'G-AAAA', 'Royaume-Uni', 'BAe 146', 111),
(2, 'G-ABBA', 'Royaume-Uni', 'BAe 146', 111),
(3, 'G-AAAZ', 'Royaume-Uni', 'BAe 146', 111),
(4, 'G-ZAGA', 'Royaume-Uni', 'BAe 146', 111),
(5, 'N-AAAA', 'USA', 'Boeing 717', 125),
(6, 'N-AZAA', 'USA', 'Boeing 717', 125),
(7, 'N-ABBA', 'USA', 'Boeing 717', 125),
(8, 'F-AAAA', 'France', 'Airbus A300', 361),
(9, 'F-ZERT', 'France', 'Airbus A300', 361),
(10, 'F-CULO', 'France', 'Airbus A300', 361),
(11, 'F-RATE', 'France', 'Airbus A300', 361),
(12, 'F-QUEE', 'France', 'Airbus A300', 361);

-- Employes

insert into t_employes (emp_nom, emp_prenom, emp_sexe, emp_age, emp_poste, emp_pays_origine) values
('DAVIDSON', 'ROBERT', 1, 40, 4, 75),
('AUDIBERT', 'STEPHANE', 1, 50, 2, 75),
('VADEBONCOEUR', 'OPHELIA', 2, 25, 2, 75),
('DESROCHES', 'RUBY', 2, 60, 3, 75),
('AMMOUR', 'ERIC', 1, 35, 1, 75);

-- Passagers

insert into t_passagers (pass_nom, pass_prenom, pass_sexe, pass_age, pass_n_place, pass_pays_origine) values
('FRISTOT','Manu', 2, 40, 111, 75),
('DUPONT','Namane', 1, 30, 41, 200),
('TROU','Bare', 1, 50, 50, 75),
('DE LAMETTE','Viriginie', 2, 20, 1, 75),
('LUC','Bate', 1, 80, 28, 75),
('VINCENT','Robert', 1, 88, 95, 200),
('MANI','Girouette', 1, 65, 45, 75),
('BLACK','Mickael', 1, 100, 35, 200),
('WHITE','Mickael', 1, 50, 18, 200),
('GRIS', 'Mickael', 1, 15, 24, 200),
('HOUSEBAD','Inconnu', 1, 54, 36, 75),
('TRHONES', 'Game', 1, 18, 18, 200);

-- Vol

insert into t_vol (vol_numero, vol_date_heure_depart, vol_date_heure_arrive, vol_aero_depart, vol_aero_arrive, vol_term_depart, vol_term_arrive, vol_comp, vol_statut) values
('AF-1234', '2021-07-01 09:45:20', '2021-07-01 11:45:20', 48, 4189, 3, null, 'AFR', 2),
('AF-3635', '2021-07-01 09:45:20', '2021-07-01 11:45:20', 48, 4189, 3, null, 'AFR', 5),
('AF-1235', '2021-09-03 10:42:12', '2021-09-03 12:42:12', 48, 4189, null, 4, 'AFR', 4),
('AF-1234', '2021-02-24 20:40:43', '2021-02-24 22:40:43', 48, 4189, 3, null, 'AFR', 1),
('AF-3636', '2021-07-01 09:45:20', '2021-07-01 11:45:20', 48, 4189, 3, null, 'AFR', 1),
('AF-1235', '2021-02-25 20:40:43', '2021-02-25 22:40:43', 48, 4189, null, 4, 'AFR', 1);

-- Vol detaille

insert into t_vol_detaille (vol_detaille_comp, vol_type) values
('AFR', 1),
('AFR', 1),
('AFR', 1),
('AFR', 1),
('AFR', 1),
('AFR', 1);

-- Modele d'avion pour le vol

insert into t_modele_avion_vol (mav_id, mav_typa_id) values
(1, 8),
(2, 9),
(3, 8),
(4, 11),
(5, 10),
(6, 11);

-- Affectation Employes et Passagers au vol

insert into t_affectation_avion_vol (aav_id_vole, aav_pp_id_employes, aav_pp_id_passagers) values
(1, null, 1),
(1, null, 2),
(1, 1, null),
(2, 2, null),
(2, 3, null),
(2, 4, null),
(2, null, 6),
(2, null, 7),
(2, null, 8),
(2, null, 9),
(2, null, 10);