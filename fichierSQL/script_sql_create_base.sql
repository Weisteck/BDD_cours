create database elevage;
use elevage;
create table animaux (
	ani_id int unsigned primary key not null auto_increment,
    date_naissance datetime not null,
    matricule varchar(50),
    especes tinyint unsigned not null,
    sexe tinyint unsigned not null,
    nom varchar(15),
    poids float(7,3),
    tailles float(4,1),
    races smallint unsigned not null,
    pays_origine smallint unsigned,
    commentaires varchar(250),
    peres int unsigned,
    meres int unsigned,
    etat tinyint unsigned not null
);
create table especes (
	esp_id_types tinyint unsigned primary key not null auto_increment,
    esp_libelle varchar(20),
    esp_environnement tinyint unsigned not null,
    esp_alimentation tinyint unsigned not null,
    esp_types tinyint unsigned not null
);
create table environnement (
	env_id tinyint unsigned primary key not null auto_increment,
    env_libelle varchar(20) not null
);
create table alimentation (
	ali_id tinyint unsigned primary key not null auto_increment,
    ali_libelle varchar(20) not null
);
create table types_espece (
	typ_id tinyint unsigned primary key not null auto_increment,
    typ_libelle varchar(20) not null
);
create table antecedents (
	ant_id mediumint unsigned primary key not null auto_increment,
    ant_date date,
    ant_texte varchar(250),
    ani_id int unsigned not null
);
create table operations (
	ope_id mediumint unsigned primary key not null auto_increment,
    ope_date datetime not null,
    ope_type tinyint unsigned not null,
    ope_commentaire varchar(250),
    employe_id tinyint unsigned not null,
    ani_id int unsigned not null
);
create table type_operation (
	to_id tinyint unsigned primary key not null auto_increment,
    to_libelle varchar(50)
);
create table employe (
	emp_id tinyint unsigned primary key not null auto_increment,
    emp_nom varchar(50),
    emp_prenom varchar(50)
);
create table vaccin (
	vac_id mediumint unsigned primary key not null auto_increment,
    vac_date date not null,
    type_vaccin tinyint unsigned,
    ani_id int unsigned
);
create table type_vaccin (
	tv_id tinyint unsigned primary key not null auto_increment,
    tv_libelle varchar(50) not null,
    tv_premier_rappel tinyint unsigned,
    tv_rappel tinyint unsigned,
    tv_prix float(5,2) not null default 0
);
create table sexe (
	sex_id tinyint unsigned primary key not null auto_increment,
    sex_libelle varchar(10)
);
create table etat_sante (
	eta_id tinyint unsigned primary key not null auto_increment,
    eta_libelle varchar(20)
);
create table pays (
	p_id smallint unsigned primary key not null auto_increment,
    iso2 varchar(2) not null,
    iso3 varchar(3) not null,
    p_libelle varchar(80) not null
);
create table race (
	rac_id smallint unsigned primary key not null auto_increment,
    rac_libelle varchar(50) not null
);
create table code_postaux (
    idCP smallint unsigned primary key auto_increment,
    CP varchar(6) not null,
    nom_ville varchar(50) not null
);
alter table animaux
add foreign key (peres) references animaux(ani_id),
add foreign key (meres) references animaux(ani_id),
add foreign key (especes) references especes(esp_id_types),
add foreign key (sexe) references sexe(sex_id),
add foreign key (races) references race(rac_id),
add foreign key (pays_origine) references pays(p_id),
add foreign key (etat) references etat_sante(eta_id);
alter table antecedents
add foreign key (ani_id) references animaux(ani_id);
alter table operations
add foreign key (ani_id) references animaux(ani_id),
add foreign key (ope_type) references type_operation(to_id),
add foreign key (employe_id) references employe(emp_id);
alter table vaccin
add foreign key (ani_id) references animaux(ani_id),
add foreign key (type_vaccin) references type_vaccin(tv_id);
alter table especes
add foreign key (esp_environnement) references environnement(env_id),
add foreign key (esp_alimentation) references alimentation(ali_id),
add foreign key (esp_types) references types_espece(typ_id);