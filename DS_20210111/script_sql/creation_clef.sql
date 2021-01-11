alter table t_vol
add foreign key (vol_aero_depart) references t_aeroport(aero_id),
add foreign key (vol_aero_arrive) references t_aeroport(aero_id),
add foreign key (vol_term_depart) references t_terminal(term_id),
add foreign key (vol_term_arrive) references t_terminal(term_id),
add foreign key (vol_comp) references t_compagnie(comp_code_OACI),
add foreign key (vol_statut) references t_statut(sta_id);

alter table t_vol_detaille
add foreign key (vol_detaille_id) references t_vol(vol_id),
add foreign key (vol_detaille_comp) references t_compagnie(comp_code_OACI),
add foreign key (vol_type) references t_types_vol(typv_id);

alter table t_passagers
add foreign key (pass_sexe) references t_sexe(sex_id),
add foreign key (pass_pays_origine) references t_pays(pays_id);

alter table t_employes
add foreign key (emp_poste) references t_postes(post_id),
add foreign key (emp_sexe) references t_sexe(sex_id),
add foreign key (emp_pays_origine) references t_pays(pays_id);

alter table t_modele_avion_vol
add foreign key (mav_id) references t_vol(vol_id),
add foreign key (mav_typa_id) references t_types_avion(typa_id);

alter table t_affectation_avion_vol
add foreign key (aav_id) references t_vol(vol_id),
add foreign key (aav_pp_id) references t_employes(emp_id),
add foreign key (aav_pp_id) references t_passagers(pass_n_cli);

alter table t_compagnie
add foreign key (comp_pays) references t_pays(pays_id);