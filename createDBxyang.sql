/* SHOW DATABASES; */
/* USE xyang; */


/* Bâtiments de l'hôpital, dont le numéro, seul attribut de la relation 
et désigné par idBatiment, allant de 1 à 6 d'habitude, est de type 
tinyint unsigned qui suffira pour de futures insertions eventuelles. */ 
CREATE TABLE IF NOT EXISTS batiment(
	idBatiment TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT 
)ENGINE=innoDB; 

/* Services */
CREATE TABLE IF NOT EXISTS service(
	idService TINYINT UNSIGNED NOT NULL PRIMARY KEY,
    libelle varchar(50) NOT NULL,
    tel char(20),
    batiment TINYINT UNSIGNED NOT NULL,
    chef MEDIUMINT UNSIGNED,
    CONSTRAINT dansUnBatiment
		FOREIGN KEY (batiment) REFERENCES batiment(idBatiment)
)ENGINE=innoDB; 

/* Chambres */
CREATE TABLE IF NOT EXISTS chambre(
	idChambre SMALLINT UNSIGNED NOT NULL PRIMARY KEY,
    nombreLits TINYINT UNSIGNED DEFAULT 1 CHECK (nombreLits IN(1, 2, 3)),
    service TINYINT UNSIGNED,
    CONSTRAINT dansUnService 
		FOREIGN KEY (service) REFERENCES service(idService)
)ENGINE=innoDB; 
    
/* Médecins */    
CREATE TABLE IF NOT EXISTS medecin(
	matricule MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(20),
    specialite TINYINT UNSIGNED NOT NULL,
	CONSTRAINT quelleSpecialite
		FOREIGN KEY (specialite) REFERENCES service(idService)
)ENGINE=innoDB; 

/* comme medecin a une clé étrangere se réréfant à service et inversement
service en a aussi une se réféfant à medecin. L'une des deux est obligée 
d'être mise en place ultérieurement. Ici j'ai choisi l'attribut chef. */
ALTER TABLE service ADD CONSTRAINT chefService
	FOREIGN KEY (chef) REFERENCES medecin(matricule);

/* Malades */
CREATE TABLE IF NOT EXISTS malade(
	idMalade MEDIUMINT UNSIGNED NOT NULL PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(20),
    sexe CHAR(1),
    age TINYINT UNSIGNED,
    contreIndication VARCHAR(250),
    chambre SMALLINT UNSIGNED, /* chambre=NULL veut dire que c'est un ancien patient 
    ou qu'il est décédé. Grâce à cette convention les autres données du patient
    pourront être conservées pour ses prochaines visites ou pour un éventuel procès. */
    CONSTRAINT chambreAffectee 
		FOREIGN KEY (chambre) REFERENCES chambre(idChambre)
)ENGINE=innoDB; 

/* Ordonnances */
CREATE TABLE IF NOT EXISTS ordonnance(
	idOrdonnance INT UNSIGNED NOT NULL PRIMARY KEY,
    datePrescription date NOT NULL,
    malade MEDIUMINT UNSIGNED NOT NULL,
    medecin MEDIUMINT UNSIGNED NOT NULL,
    CONSTRAINT ordonnanceMalade 
		FOREIGN KEY (malade) REFERENCES malade(idMalade),
	CONSTRAINT  ordonnanceMedecin
		FOREIGN KEY (medecin) REFERENCES medecin(matricule)
)ENGINE=innoDB;

/* Médicaments */
CREATE TABLE IF NOT EXISTS medicament(
	idMedicament INT UNSIGNED NOT NULL PRIMARY KEY,
    libelle VARCHAR(250)
)ENGINE=innoDB;

/* Instructions, alors la table pour chaque médicament préscris */
CREATE TABLE IF NOT EXISTS instruction(
	ordonnance INT UNSIGNED NOT NULL,
    medicament INT UNSIGNED NOT NULL,
    posologie VARCHAR(250),
    dosage VARCHAR(250),
    duree DATE, /* pour simplifier ultérieurement les requêtes,
    ici la date jusqu'à laquelle le médicament doit être pris. */
    destockage TINYINT, /* 1 si déstocké 0 sinon, NULL par défaut
    si l'ordonnance n'est pas encore traitée par la pharmacie. */
    motifRefus VARCHAR(250),
    PRIMARY KEY (ordonnance, medicament),
    CONSTRAINT instructionOrdonnance
		FOREIGN KEY (ordonnance) REFERENCES ordonnance(idOrdonnance),
	CONSTRAINT instructionMedicament
		FOREIGN KEY (medicament) REFERENCES medicament(idMedicament)
)ENGINE=innoDB;





    
/* Contrainte que le nombre de lits d'une chambre ne dépasse pas 3, sinon refus d'insertion */
DELIMITER //
CREATE TRIGGER `tropDeLitsDansLaChambre` BEFORE INSERT ON `chambre`
FOR EACH ROW
BEGIN
    IF NEW.nombreLits >= 4 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Chambre n''heberge pas plus que 3 !';
    END IF;
END //
DELIMITER ;

# Données pour vérifier le trigger  INSERT INTO chambre values (2780, 4, 25);
# DROP TRIGGER tropDeLitsDansLaChambre;


/* Contrainte que le nombre de malades d'une chambre ne dépasse pas le nombre de lits, sinon refus d'insertion */
DELIMITER //
CREATE TRIGGER `tropDeMondeDansLaChambre` BEFORE INSERT ON `malade`
FOR EACH ROW BEGIN
DECLARE nombreMaladesDansUneChambre TINYINT;
DECLARE nombreMaladesMaxi TINYINT;
    SET nombreMaladesDansUneChambre = (SELECT COUNT(*) FROM malade WHERE chambre = NEW.chambre);
    SET nombreMaladesMaxi = (SELECT nombreLits FROM chambre WHERE idChambre = NEW.chambre);
    IF nombreMaladesDansUneChambre > nombreMaladesMaxi THEN
		SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Trop de monde dans la chambre !';
    END IF;
END //
DELIMITER ;

# Données pour vérifier le trigger  INSERT INTO malade (idMalade, chambre) VALUES (333343, 2780), (333344, 2780);
# INSERT INTO malade (idMalade, chambre) VALUES (333346, 2779);
# DROP TRIGGER tropDeMondeDansLaChambre;


/* Contrainte que le nombre de lits d'un service ne dépasse pas 60, sinon refus d'insertion */
DELIMITER //
CREATE TRIGGER `tropDeLitsPourUnService` AFTER INSERT ON `chambre`
FOR EACH ROW BEGIN
DECLARE nombreLitsDunService TINYINT;
    SET nombreLitsDunService = (SELECT SUM(nombreLits) FROM chambre WHERE service = NEW.service);
    IF nombreLitsDunService > 60 THEN
		SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Pas plus que 60 lits pour un service !';
    END IF;
END //
DELIMITER ;

# Données pour vérifier le trigger  Insert INTO chambre VALUES (2151, 3, 21), (2152, 3, 21), (2153, 3, 21), (2154, 3, 21), (2155, 3, 21), 
# (2156, 3, 21), (2157, 3, 21), (2158, 3, 21), (2159, 3, 21);
# DROP TRIGGER tropDeLitsPourUnService;

    