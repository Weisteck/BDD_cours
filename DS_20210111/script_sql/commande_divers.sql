insert into t_aeroport (aero_id, aero_identification, aero_type, aero_name, aero_iso_country, aero_municipality) (select id, ident, `type`, `name`, iso_country, municipality from tmp_airport);
