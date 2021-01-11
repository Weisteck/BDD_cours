# Admin BDD DS Lyon Ynov - 2021

## Sommaires

1. Commentaires Généraux
2. Le dossier GIT
3. Les consignes

## Commentaires Généraux

La table `t_terminal` et `t_types_avion` aurait pu s'incrémenter sur son id mais je n'ai vu cela qu'après coup.

De plus dans la table `t_types_avion`, la donnée `typa_constructeur` pourrait renvoyer sur la table `t_pays` et son `id`.

J'ai essayé d'optimiser au mieux le nombre de table ainsi qu'éviter au mieuxx la redondance.

## Le dossier GIT

```bash

DS_20210111/
├── brouillons
│   ├── 20210111_brouillon1.jpg
│   ├── 20210111_brouillon2.jpg
│   └── 20210111_brouillon3.jpg
├── dump_file
│   ├── dump_file_aeroport_20210111_1918.sql
│   ├── dump_file_aeroport_20210111_2046.sql
│   └── dump_file_aeroport_final.sql
├── fichiers_a_dispo
│   ├── airports.csv
│   └── sql-pays.sql
├── mcd_mld
│   └── aeroport_mcd.pdf
├── README.md
└── script_sql
    ├── approvision_table.sql
    ├── commande_divers.sql
    ├── creation_clef.sql
    └── creation_table.sql

```

* Dans brouillons se trouve ma reflexion sur papier.
* Le dossier dump_file contient les différentes sauvegardes que j'ai effectué de la base mysql.
* Les fichiers a disposition pour pouvoir réaliser l'exercice.
* Les captures d'écran du MCD et MLD.
* Et les différents scripts SQL qui ont été passé pour réaliser l'exercice.

### Initialiser la base sans dump_file

L'ordre dans lequel on doit éxécuter les scripts si l'on veut initialiser la base sans le dump_file :
1. faire passer celui de `creation_table.sql`
2. utiliser le début du fichier `sql-pays.sql` dans les documents fournis
3. lancer `creation_clef.sql`
4. importer le fichier CSV
5. Approvisionner les tables :
    * En premier avec la fin du fichier `sql-pays.sql`
    * En second avec `approvision_table.sql`

:warning: Rappel :
> Pour l'utilisation de commande SQL je vous invite à retourner à la racine du [GIT](https://github.com/Weisteck/BDD_cours)

## Les consignes

> A la suite de l'amerrissage forcé du vol US Airways 1549 du 15 Janvier 2009, votre compagnie s'est rendue compte qu'il est difficile de garder la trace des passagers pour les vols intérieurs sans manifeste des passagers ce qui a rendu le décompte des survivants complexe en n'ayant pas de base de référence pour les contacter directement. il a fallu les rechercher 1 par 1 en utilisant les personnels de secours.
> Elle vous a donc mandaté afin de mettre à jour leur base de données pour prendre en compte cette nouvelle fonctionnalité.

### Le besoin 

- La compagnie souhaite pouvoir afficher le tableau des départs et des arrivées.
Sur ce tableau, elle souhaite voir apparaitre les informations suivantes :
 * Date heure des départ et des arrivée
 * Aéroport départ et d'arrivée
 * N°Vol
 * Le Terminal d'où part et où arrivera l'appareil
 * La compagnie qui effectue le vol.
 * Le status du vol (embarquement en cours, embarquement terminé, à l'heure, en retard, à l'approche). Celui-ci peut ne rien afficher.

Si on clique sur le N° de vol, celui-ci doit pouvoir afficher les informations suivantes :
* N°Vol
* La compagnie qui effectue ce vol
* Type de vol (Commercial, Sanitaire, Cargo)

Les compagnies doivent être renseigné selon la norme OACI.

Notre aéroport dispose déjà de terminaux existants (de A1 à A4 et de B1 à B4) mais nous projetons d'en ajouter et leur nom pourraient aller jusqu'à 5 caractère Alpha Numériques.

Les gens sont curieux et le marketing nous informe qu'ils aiment savoir sur quel type d'avion ils vont voler (Constructeurs, modèle, Immatriculation, Nb Places)

Les constructeurs les plus répandus seront Utilisés (Airbus, Boieng, Embraer, Piltatus, McDonnel-Douglas, Cessna)

Cependant, nous voulons savoir, au besoin qui est son équipage et le personnel assigné et donc leurs noms, prénoms, sexes, ages et leur postes (commandant de bord, co-pilote, hôtesses/stewards).

Enfin, le manifeste des passagers est établi pour un vol. Il devra contenir les informations standards des passagers (Nom, Prénom, Sexe, Age et leur N° de client) ainsi que la place qu'ils occupent.

La compagnie est rigoureuse et souhaite que les données soient fluides et optimisées en limitant la redondance au minimum ainsi que le nombre de tables requises.

Afin d'être en conformité avec les appellations officielles, et afin de vous aider dans ce développement, nous avons récupérer la liste des pays (fichier au format SQL) et la liste des aéroports à importer (Fichier CSV). Cependant le fichier des aéroports, très complet, contient des données dont nous ne nous servirons pas (Latitude, longitude, élévation, continent, iso_region).

### La réalisation

* Via un MLD puis un MCD, concevoir la base de données avec les tables requises.
* Insérer des données cohérentes afin que nous puissions faire les premiers tests.
* Etablir des index permettant un accès pertinent au données.

### La restitution

* Faire une capture (photo lisible acceptée) du MLD et du MCD.
* Faire un dump de la base créée avec les données cohérentes.

## Ressources
* [Liste des codes AITA](https://fr.wikipedia.org/wiki/Liste_des_codes_AITA_des_compagnies_a%C3%A9riennes)
* [Numéro de vol](https://fr.wikipedia.org/wiki/Num%C3%A9ro_de_vol)
* [Nombre d'avion chaque jour](https://www.lalibre.be/international/combien-d-avions-volent-chaque-jour-dans-le-monde-infographie-57430e0135708ea2d5c4b79a)
* [Liste ISO des pays](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
* [Liste des codes OACI] (https://fr.wikipedia.org/wiki/Liste_des_codes_OACI_des_compagnies_a%C3%A9riennes)
* [Immatriculation des aéronefs](https://fr.wikipedia.org/wiki/Immatriculation_des_a%C3%A9ronefs#Normes_internationales)