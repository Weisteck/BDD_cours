use elevage;

-- Etat sante

INSERT INTO etat_sante (eta_libelle) 
VALUES 
('Bonne santé'),
('OK'),
('Mauvaise santé'),
('Urgent'),
('Mort');

-- Sexes

INSERT INTO sexe (sex_libelle) 
VALUES 
('Male'),
('Femelle'),
('Autre');

-- Race:

INSERT INTO race (rac_libelle) 
VALUES 
('Bleu Russe'),
('Bombay'),
('Ceylan'),
('Exotic'),
('German Rex'),
('Japanese Bobtail'),
('Siamois'),
('Chartreux');

-- Environnement

INSERT INTO environnement (env_libelle) 
VALUES 
('Montagneux'), 
('Desertique'), 
('Grand Froid'), 
('Tempéré'), 
('Tropical'), 
('Continental'), 
('Méditéranéen');

-- Types especes

INSERT INTO types_espece (typ_libelle) 
VALUES 
('Vertébres'),
('Amphibiens'),
('Crocodiliens'),
('Mammifères'),
('Oiseaux'),
('Poissons');


-- Alimentation


INSERT INTO alimentation (ali_libelle) 
VALUES 
('Frugivore'),
('Nectavivore'),
('Carnivore'),
('Omnivore'),
('Herbivore'),
('Granivore');

-- Employés

INSERT INTO employe (emp_nom, emp_prenom) 
VALUES 
('FRISTOT','Manu'),
('DUPONT','Namane'),
('TROU','Bare'),
('DE LAMETTE','Viriginie'),
('LUC','Bate'),
('VINCENT','Robert'),
('MANI','Girouette'),
('BLACK','Mickael'),
('WHITE','Mickael'),
('GRIS', 'Mickael'),
('HOUSEBAD','Inconnu'),
('TRHONES', 'Game');

-- Especes

INSERT INTO especes (esp_libelle, esp_environnement, esp_alimentation, esp_types)
VALUES
('CHAT', 6, 4, 4);

-- Animaux

INSERT INTO animaux 
(date_naissance, matricule, sexe, nom, poids, tailles, peres, meres, 
races, pays_origine, especes, etat) 
VALUES 
(date('2020-01-02'),'22WZ7', 1 ,'Chacha','2.5','25',null,null, 1, null, 1, 2),
(date('2020-10-10'),'3N85S', 1,'Chausette','3.5','30',null,null, 2, null, 1, 1),
(date('2019-07-25'),'B455P', 1 ,'Blanc','4.5','20',null,null, 4, null, 1, 2),
(date('2018-10-02'),'585VR', 2 ,'Chippie','2.7','23',null,null, 5, null, 1, 2),
(date('2016-01-13'),'865FD', 1 ,'Gary','3.6','25',null,null, 6, null, 1, 2),
(date('2010-01-02'),'W5U56', 1 ,'Bob','4.1','26',null,null, 6, null, 1, 2),
(date('2015-09-20'),'7U7A3', 2 ,'Jimette','2.7','23',null,null, 5, null, 1, 2),
(date('2017-06-15'),'77U6Y', 1 ,'Boy','1.6','20', null, null, 1, null, 1, 2),
(date('2018-04-18'),'N92X4', 2 ,'Grissette','4.4','20', null, null, 6, null, 1, 2),
(date('2019-05-09'),'7G45B', 1 ,'Noireau','3.3','26', null, null, 6, null, 1, 2),
(date('2014-05-23'),'T23D9', 2 ,'Ela','3.5','30', null, null, 6, null, 1, 2),
(date('2016-12-02'),'792AE', 1 ,'Brown','2.9','35', null, null, 7, null, 1, 2),
(date('2000-12-12'),'69L8M', 2 ,'Celine','4.1','31', null, null,7, null, 1, 2);