# Admin BDD cours Lyon Ynov - 2020

## Sommaire
* [Les dossiers du GIT](#dossier)
* [Les notions abordés](#notions)
* [Ressources](#ressource)
* [Phrase de fin](#fin)

## Les dossiers du GIT {#dossier}

* csv : fichiers csv utilisé
* fichierSQL : scripts SQL utilisé
* machine : VM utilisé et son installation 
    * à venir un vagrant pour initialiser une machine directement prête

## Les notions abordés {#notions}

1. [Installation de MySQL (ne sera pas détaillé ici, cf machine/README.md)](#install)
2. [Les interfaces SQL](#interface)
3. [Configuration MySQL](#conf)
4. [Les journaux](#journaux)
5. [Sécurité - Users, privilèges](#secu)
6. [Types de données](#types)
7. [Sauvegarde](#sauvegarde)
8. [Maintenance - index / statistiques](#maintenance)

### SQL interface {#interface}

#### DML

Le Data Manipulation Language : `SELECT, DELETE, UPDATE, INSERT, MERGE`

#### DDL

Le Data Definition Language : `CREATE, ALTER, DROP, RENAME, TRUNCATE, COMMENT`

#### DCL

Le Data Control Language : `GRANT, REVOKE`

#### TCL

Le Transaction Control Language

### Configuration MySQL {#conf}

Les fichiers `my.ini` et `my.cnf` servent de global options.

`defaults-extra-file` ?.

`.mylogin.cnf` : Login path options (:warning: clients only).

`mysqld-auto.cnf` : System variables persisted with `SET PERSIST` or `SET PERSIST_ONLY` (:warning: server only).

:warning: La modification de ces fichiers peuvent être critique, faire une sauvegarde de fichier avant toutes modifications.

Workbench permet de modifier également les fichiers de configuration via une interface graphique.

Par défaut la configuration est faite avec le root pour la machine locale. il suffit de se rappeler le mot de passe renseigné pendant l'installation.

Certains paramètres se configurent aussi directement via la ligne de commande et à la volée.

### Les journaux {#journaux}

Il y a 6 journaux :

:warning: sous Windows MySQL n'active aucun log à part `error_log`.

Pour les activer, modifier le fichier my.ini / my.cnf, redémarrage requis. [more](https://tecadmin.net/enable-logs-in-mysql/)

| Log Type | Information écrite dans les logs |
| -------- | -------------------------------- |
| Error log | Problème rencontré lors du démarrage, en-cours, ou de l'arrêt de mysqld |
| General query log | Les connections clients établies et les status reçus du client |
| Binary log | Status sur le changement de données |
| Relay log | les modifications de données reçues d'un serveur source de réplication |
| Slow query log | Les requêtes qui ont pris |
| DDL Log | Opérations de métadonnées effectuées par les déclarations de DDL |

### Sécurité - Users et privilèges {#secu}

#### Création d'un utilisateur

```sql
CREATE USER 'nom_user' IDENTIFIED BY 'mot de passe';
CREATE USER 'nom_user'@'hôte de connexion' IDENTIFIED BY 'mot de passe';
```
:warning: Par défaut, l'utilisateur root est créé pour localhost.

#### Privilièges, rôles

Associer un droit à un utilisateur :
```sql
-- Mettre un droit
GRANT <nom du droit> ON <nom_objet> TO <nom_user>;

-- Enlever un droit
REVOKE SELECT ON shield.* FROM 'Stark';
```
Associer un role à un utilisateur :
```sql
-- Création d'un role
CREATE ROLE <Nom du rôle>;

-- Suppression d'un role
DROP ROLE <Nom du rôle>;

-- Assignation d'un privilège à un rôle 
GRANT <Privilège> TO <Nom du rôle>;

-- Assignation d'un rôle à un utilisateur
GRANT <Nom du rôle> TO <Utilisateur>;
```
On peut remplacer `GRANT` par `REVOKE` si l'on veut révoquer.
![More](https://dev.mysql.com/doc/refman/8.0/en/roles.html).

### Types de données {#types}

![More](https://docs.microsoft.com/fr-fr/sql/odbc/reference/appendixes/sql-data-types?view=sql-server-ver15).

L'attribut `UNSIGNED` supprime la gestion du signe.
Exemple : En `TINYINT`, la plage ne sera plus de -127 à 127 mais de 0 à 255.

Les plus utilisés :
* Numérique entier : `INT`
* Numérique décimal : `DECIMAL`, `NUMERIC`, `FLOAT`, `DOUBLE`
* Texte, chaine de caractère : `VARCHAR()`
* Date : `DATE`, `DATETIME`

### Sauvegarde {#sauvegarde}

Pour une sauvegarde global :
```sh
# Importer une base à partir du sauvegarde
mysql -u root -p nouvellebase < dump_file.sql

# Exporter une base
mysqldump -u root -p elevage > dump_file.sql
```

Le point in time (avec les binary log) :
```sh
#Restauration Point In Time des données jusqu’à la position 2000 du binlog mysql-bin.000012

mysqlbinlog –stop-position=2000 /binlog/mysql-bin.000012 | mysql -u root -p
```
![More](https://dev.mysql.com/doc/refman/8.0/en/mysqlbinlog.html).

![Percona](https://www.percona.com/doc/percona-xtrabackup/8.0/index.html).

### Maintenance - index / statistiques {#maintenance}

Création d'un index : 
```sql
CREATE INDEX `index_nom` ON table (`colonne1`, `colonne2`);
```
:warning: l'ordre des colone à son importance.

Etat bdd si ça rame ou pas :
```sql
SELECT
    TABLE_SCHEMA,
    TABLE_NAME, ENGINE,
    DATA_LENGTH/1024/1024 as DATA_SIZE_MO,
    INDEX_LENGTH/1024/1024  as INDEX_SIZE_MO,
    DATA_FREE/1024/1024 as DATA_FREE_MO,
    (DATA_FREE/1024/1024/ (DATA_LENGTH/1024/1024+INDEX_LENGTH/1024/1024)) as TAUX_FRAG
FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_SCHEMA NOT IN ('mysql','information_schema','performance_schema')
        AND ENGINE IN ('INNODB', 'MyISAM')
        AND TABLE_TYPE = 'BASE TABLE'
        AND DATA_FREE > 0;
```

Reconstruction des indexs :
```sql
-- Sur MySQL
OPTIMIZE TABLE nom_table

--- Autres SGBD
ALTER INDEX [schema.]NomIndex REBUILD [ONLINE];
```

## Ressources {#ressource}
* ![Moodle BDD](https://moodle.ynov.com/course/view.php?id=8888).
* ![SQL](https://sql.sh).
* ![Guest Additions Centos](https://www.tecmint.com/install-virtualbox-guest-additions-on-centos-8/).
* ![Activation logs Winoob](https://tecadmin.net/enable-logs-in-mysql/).
* ![SQL privilèges/roles](https://dev.mysql.com/doc/refman/8.0/en/roles.html).
* ![SQL Types de données](https://docs.microsoft.com/fr-fr/sql/odbc/reference/appendixes/sql-data-types?view=sql-server-ver15).
* ![Lock des tables](https://dev.mysql.com/doc/refman/8.0/en/internal-locking.html).
* ![Point in time](https://dev.mysql.com/doc/refman/8.0/en/mysqlbinlog.html).
* ![Percona](https://www.percona.com/doc/percona-xtrabackup/8.0/index.html).
* ![Cluster](https://www.mysql.com/fr/products/cluster/mysql-cluster-datasheet.fr.pdf)
* ![SQL trick](https://www.linuxtricks.fr/wiki/print.php?id=248)

## Phrase de fin {#fin}
"Tu auras compris que la violence ne résout rien lorsqu'un moustique ce sera poser sur tes couilles."