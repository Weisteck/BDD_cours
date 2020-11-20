use elevage;

select count(*) from 
(
SELECT DISTINCT Code_postal, Libelle_d_acheminement from cp_tmp
UNION ALL
SELECT Code_postal, Ligne_5 from cp_tmp 
    WHERE Ligne_5 IS not null
) compt;

INSERT INTO code_postaux (CP, nom_ville) ( SELECT DISTINCT Code_postal, Ligne_5 FROM cp_tmp WHERE Ligne_5 <> '' );
INSERT INTO code_postaux (CP, nom_ville) ( SELECT DISTINCT Code_postal, Libelle_d_acheminement FROM cp_tmp);

use elevage;
show table status;
alter table code_postaux auto_increment=1;
drop table code_postal;
commit;

select max(idCP) from code_postaux;
