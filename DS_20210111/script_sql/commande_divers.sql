insert into t_aeroport (aero_id, aero_identification, aero_type, aero_name, aero_iso_country, aero_municipality) (select id, ident, `type`, `name`, iso_country, municipality from tmp_airport);


-- Exemple de requete que l'on peut faire pour obtenir un tableau des départs

select 
	vol_numero
    ,vol_date_heure_depart
    ,vol_date_heure_arrive
    ,null 'Aeroport départ'
    ,aero_name 'Aeroport arrivé'
    ,term_code
    ,term_description
    ,comp_name
    ,sta_description
from t_vol
	inner join t_terminal on vol_term_depart = term_id
    inner join t_aeroport on vol_aero_depart = aero_id
    inner join t_compagnie on vol_comp = comp_code_OACI
    inner join t_statut on vol_statut = sta_id
union all
select 
	vol_numero
    ,vol_date_heure_depart
    ,vol_date_heure_arrive
    ,aero_name 'Aeroport départ'
    ,null 'Aeroport arrivé'
    ,term_code
    ,term_description
    ,comp_name
    ,sta_description
from t_vol
	inner join t_terminal on vol_term_depart = term_id
    inner join t_aeroport on vol_aero_arrive = aero_id
    inner join t_compagnie on vol_comp = comp_code_OACI
    inner join t_statut on vol_statut = sta_id