DROP TABLE IF EXISTS instruction;
DROP TABLE IF EXISTS medicament;
DROP TABLE IF EXISTS ordonnance;
DROP TABLE IF EXISTS malade;
/* comme medecin a une clé étrangere se réréfant à service et inversement
service en a aussi une se réféfant à medecin. L'une des deux est obligée 
d'être supprimée au préalable. Ici c'est l'attribut chef. */
ALTER TABLE service DROP FOREIGN KEY chefService;
DROP TABLE IF EXISTS medecin;
DROP TABLE IF EXISTS chambre;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS batiment;
