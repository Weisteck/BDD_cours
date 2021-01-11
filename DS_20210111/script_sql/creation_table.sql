create database aeroport;

use aeroport;

create table t_compagnie (
    comp_code_OACI char(3) primary key not null,
    comp_name varchar(50),
    comp_pays smallint(5) unsigned NOT NULL
);

create table t_terminal (
    term_id tinyint unsigned primary key not null auto_increment,
    term_code varchar(5) not null,
    term_description varchar(50)
);

create table t_types_avion (
    typa_id smallint unsigned primary key not null auto_increment,
    typa_immatriculation varchar(10) not null,
    typa_constructeur varchar(50) not null,
    typa_modele varchar(30) not null,
    typa_nb_place smallint unsigned not null
);

create table t_employes (
    emp_id int unsigned primary key not null auto_increment,
    emp_nom varchar(50) not null,
    emp_prenom varchar(50) not null,
    emp_sexe tinyint unsigned not null,
    emp_age tinyint unsigned not null,
    emp_poste tinyint unsigned not null,
    emp_pays_origine smallint(5) unsigned NOT NULL
);

create table t_passagers (
    pass_n_cli int unsigned primary key not null auto_increment,
    pass_nom varchar(50) not null,
    pass_prenom varchar(50) not null,
    pass_sexe tinyint unsigned not null,
    pass_age tinyint unsigned not null,
    pass_n_place varchar(10),
    pass_pays_origine smallint(5) unsigned NOT NULL
);

create table t_aeroport (
    aero_id int unsigned primary key not null auto_increment,
    aero_identification varchar(15) unique key not null,
    aero_type varchar(20) not null,
    aero_name varchar(80) not null,
    aero_iso_country char(2) not null,
    aero_municipality varchar(40)
) auto_increment = 337590 ;

create table t_sexe (
    sex_id tinyint unsigned primary key not null auto_increment,
    sex_genre varchar(15)
);

create table t_postes (
    post_id tinyint unsigned primary key not null auto_increment,
    post_intitule varchar(25) not null
);

create table t_types_vol (
    typv_id tinyint unsigned primary key not null auto_increment,
    typv_description varchar(20) not null
);

create table t_statut (
    sta_id tinyint unsigned primary key not null auto_increment,
    sta_description varchar(20)
);

create table t_vol (
    vol_id bigint unsigned primary key not null auto_increment,
    vol_numero varchar(10) not null,
    vol_date_heure_depart datetime not null,
    vol_date_heure_arrive datetime not null,
    vol_aero_depart int unsigned not null,
    vol_aero_arrive int unsigned not null,
    vol_term_depart tinyint unsigned,
    vol_term_arrive tinyint unsigned,
    vol_comp char(3) not null,
    vol_statut tinyint unsigned not null
);

create table t_vol_detaille (
    vol_detaille_id bigint unsigned primary key not null auto_increment,
    vol_detaille_comp char(3) not null,
    vol_type tinyint unsigned not null
);

create table t_modele_avion_vol (
    mav_id bigint unsigned primary key not null,
    mav_typa_id smallint unsigned not null
);

create table t_affectation_avion_vol (
    aav_id bigint unsigned primary key not null auto_increment,
    aav_id_vole bigint unsigned not null,
    aav_pp_id_employes int unsigned,
    aav_pp_id_passagers int unsigned
);