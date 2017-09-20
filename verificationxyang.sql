SHOW CREATE TABLE batiment;
DESC batiment;

ALTER TABLE batiment 
MODIFY id tinyint(1) unsigned NOT NULL AUTO_INCREMENT; 
insert batiment values (2);
insert batiment values();
select * from batiment;
insert batiment values (288);
ALTER TABLE batiment change id idBatiment TINYINT UNSIGNED NOT NULL AUTO_INCREMENT;

show create TABLE service;

INSERT chambre (idChambre, nombreLits) values (20, 30);
INsert chambre (idChambre) values (26);
select * from chambre;

alter table chambre add check (count(service) < 10);


insert batiment values (1);
insert batiment values (2);
select *from batiment; 
insert service (idService, libelle, batiment) values (4, 'generaliste', 1);
insert service (idService, libelle, batiment) values (5, 'generaliste1', 1);
insert service (idService, libelle, batiment) values (6, 'generaliste2', 1);

insert chambre (idChambre, service) values(7, 6);
insert chambre (idChambre, service) values(8, 6), (9, 6);
insert chambre (idChambre, service) values(10, 6), (11, 6), (12, 6), (13, 6), (14, 6), (15, 6), (16, 6), (17, 6), (18, 6), (19, 6);
insert chambre (idChambre, service) values(21, 6);
select * from chambre;
select count(service) from chambre;

alter table chambre add CHECK ((select count(service) from chambre) < 10);
select service from chambre group by service having count(service) > 10;
(select count(service) from chambre) ;
delete from chambre where service = 6;


select * from service;
select * from chambre;

select specialite, count(specialite) from medecin group by specialite;


delete from chambre where idChambre = 4101 or 4102;
select * from chambre;
select count(distinct idChambre) from chambre;
select count(idChambre) from chambre;
select idChambre from chambre;


delete from medecin;

select nom, prenom from medecin where matricule in (select chef from service);
select chef from service where chef not in (select matricule from medecin);

select table1.matricule, table1.nom from 
(medecin table1 inner join medecin table2 on table1.matricule=table2.matricule)
where table1.nom != table2.nom;

ALTER TABLE medicament CHANGE libelle libelle varchar(250);

select * from medicament;

delete from medicament;

select @@datadir;


select count(*) from medecin inner join malade where specialite = floor(chambre/100); 

create table if not exists trytable(
	id int,
    id1 int,
    id2 int
)engine=innoDB;

insert into trytable
(id, id1, id2)
select floor(10000*rand()), matricule, idMalade from medecin inner join malade where specialite = floor(chambre/100); 
select count(distinct id) from trytable;
select count(*) from trytable;
select * from trytable;

SELECT * from ordonnance where malade = 9995124;
select specialite from medecin where matricule = 12692880;


select * from instruction;

select max(idMalade) from malade;

DELETE from ordonnance;

select count(*) from medecin;

insert into malade values (


