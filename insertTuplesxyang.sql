##############################
/* Création des 6 bâtiments */
##############################
INSERT batiment VALUES (1), (2), (3), (4), (5), (6); 


##############################
/* Création des 24 services */
##############################
INSERT service VALUES 
(11, 'Direction', '03.88.88.88.11', 1, NULL), 
(12, 'Service Comptabilité', '03.88.88.88.12', 1, NULL), 
(13, 'Administration', '03.88.88.88.13', 1, NULL), 
(14, 'Logistique', '03.88.88.88.14', 1, NULL), 
(15, 'Salle de Garde', '03.88.88.88.15', 1, NULL),

(21, 'Médecine générale', '03.88.88.88.21', 2, NULL),
(22, 'Médecine interne', '03.88.88.88.22', 2, NULL),
(23, 'Cardiologie', '03.88.88.88.23', 2, NULL),
(24, 'Pneumologie', '03.88.88.88.24', 2, NULL), 
(25, 'Gastro-entérologie', '03.88.88.88.25', 2, NULL), 

(31, 'Immunologie', '03.88.88.88.31', 3, NULL), 
(32, 'Endocrinologie', '03.88.88.88.32', 3, NULL), 
(33, 'Urologie', '03.88.88.88.33', 3, NULL), 
(34, 'Gynécologie', '03.88.88.88.34', 3, NULL), 
(35, 'Maternité', '03.88.88.88.35', 3, NULL), 

(41, 'Traumatologie', '03.88.88.88.41', 4, NULL), 
(42, 'Dermatologie', '03.88.88.88.42', 4, NULL), 
(43, 'Service des grands brûlés', '03.88.88.88.43', 4, NULL), 
(44, 'Chirurgie', '03.88.88.88.44', 4, NULL), 

(51, 'Transfusion sanguine', '03.88.88.88.51', 5, NULL), 
(52, 'Laboratoires d''analyse', '03.88.88.88.52', 5, NULL), 
(53, 'Radiologie', '03.88.88.88.53', 5, NULL), 

(61, 'Pharmacie', '03.88.88.88.61', 6, NULL), 
(62, 'Service d''accueil de traitement des urgences','03.88.88.88.62', 6, NULL);


############################################################
/* Création des 210 chambres, dont 196 équipées de 3 lits */
############################################################
/* Je montre ici les deux façons d'insérer un n-uplet. */ 
/* Quand une chambre libre n'est pas encore attribuée à un service : */
INSERT chambre (idChambre) VALUES (7199), (7299); 
/* Quand une chambre a été attribuée mais on ne connait pas encore le nombre
de lits, ce qui prend en premier temps la valeur par défaut qui est 1 : */
INSERT chambre (idChambre, service) VALUES (6250, 62), (6251, 62);
/* Quand on connait toutes les informations sur la chambre : */
INSERT chambre VALUES 
(2101, 3, 21), (2102, 3, 21), (2103, 3, 21), (2104, 3, 21), (2105, 3, 21), 
(2106, 3, 21), (2107, 3, 21), (2108, 3, 21), (2109, 3, 21), (2110, 3, 21), 
(2111, 3, 21), (2112, 3, 21), (2113, 3, 21), (2114, 3, 21),
(2201,3,22),(2202,3,22),(2203,3,22),(2204,3,22),(2205,3,22),(2206,3,22),(2207,3,22),
(2208,3,22),(2209,3,22),(2210,3,22),(2211,3,22),(2212,3,22),(2213,3,22),(2214,3,22),
(2301,3,23),(2302,3,23),(2303,3,23),(2304,3,23),(2305,3,23),(2306,3,23),(2307,3,23),
(2308,3,23),(2309,3,23),(2310,3,23),(2311,3,23),(2312,3,23),(2313,3,23),(2314,3,23),
(2401,3,24),(2402,3,24),(2403,3,24),(2404,3,24),(2405,3,24),(2406,3,24),(2407,3,24),
(2408,3,24),(2409,3,24),(2410,3,24),(2411,3,24),(2412,3,24),(2413,3,24),(2414,3,24),
(2501,3,25),(2502,3,25),(2503,3,25),(2504,3,25),(2505,3,25),(2506,3,25),(2507,3,25),
(2508,3,25),(2509,3,25),(2510,3,25),(2511,3,25),(2512,3,25),(2513,3,25),(2514,3,25),

(3101,3,31),(3102,3,31),(3103,3,31),(3104,3,31),(3105,3,31),(3106,3,31),(3107,3,31),
(3108,3,31),(3109,3,31),(3110,3,31),(3111,3,31),(3112,3,31),(3113,3,31),(3114,3,31),
(3201,3,32),(3202,3,32),(3203,3,32),(3204,3,32),(3205,3,32),(3206,3,32),(3207,3,32),
(3208,3,32),(3209,3,32),(3210,3,32),(3211,3,32),(3212,3,32),(3213,3,32),(3214,3,32),
(3301,3,33),(3302,3,33),(3303,3,33),(3304,3,33),(3305,3,33),(3306,3,33),(3307,3,33),
(3308,3,33),(3309,3,33),(3310,3,33),(3311,3,33),(3312,3,33),(3313,3,33),(3314,3,33),
(3401,3,34),(3402,3,34),(3403,3,34),(3404,3,34),(3405,3,34),(3406,3,34),(3407,3,34),
(3408,3,34),(3409,3,34),(3410,3,34),(3411,3,34),(3412,3,34),(3413,3,34),(3414,3,34),
(3501,3,35),(3502,3,35),(3503,3,35),(3504,3,35),(3505,3,35),(3506,3,35),(3507,3,35),
(3508,3,35),(3509,3,35),(3510,3,35),(3511,3,35),(3512,3,35),(3513,3,35),(3514,3,35),

(4101,3,41),(4102,3,41),(4103,3,41),(4104,3,41),(4105,3,41),(4106,3,41),(4107,3,41),
(4108,3,41),(4109,3,41),(4110,3,41),(4111,3,41),(4112,3,41),(4113,3,41),(4114,3,41),
(4201,3,42),(4202,3,42),(4203,3,42),(4204,3,42),(4205,3,42),(4206,3,42),(4207,3,42),
(4208,3,42),(4209,3,42),(4210,3,42),(4211,3,42),(4212,3,42),(4213,3,42),(4214,3,42),
(4301,3,43),(4302,3,43),(4303,3,43),(4304,3,43),(4305,3,43),(4306,3,43),(4307,3,43),
(4308,3,43),(4309,3,43),(4310,3,43),(4311,3,43),(4312,3,43),(4313,3,43),(4314,3,43),
(4401,3,44),(4402,3,44),(4403,3,44),(4404,3,44),(4405,3,44),(4406,3,44),(4407,3,44),
(4408,3,44),(4409,3,44),(4410,3,44),(4411,3,44),(4412,3,44),(4413,3,44),(4414,3,44),

(6201,1,62),(6202,1,62),(6203,1,62),(6204,1,62),(6205,1,62),(6206,1,62),(6207,1,62),
(6208,1,62),(6209,1,62),(6210,1,62);


###############################
/* Création des 214 médecins */
###############################
/* données générées par generatedata.com */

INSERT medecin (matricule, nom, prenom, specialite) VALUES 
(10000001, 'Yang', 'Xian', 11), /* Directeur ! */

(15197983,"Benoit","Nicolas",12),(15429007,"Mathieu","Éloïse",12),(15550461,"Pierre","Julie",15),
(16053568,"Lambert","Malik",12),(16079461,"Meyer","Mathieu",13),(10472277,"Roux","Capucine",13),
(10750104,"Le roux","Kevin",12),(11728941,"Lebrun","Éloïse",13),(16648608,"Dufour","Marion",15),
(12206066,"Barre","Maïlé",12),(14836114,"Girard","Tom",14),(16598447,"Gauthier","Constant",14),
(15048704,"Jacquet","Angelina",12),(11724312,"Le gall","Kevin",13),(14102074,"Guillaume","Timéo",14),
(16359193,"Gautier","Charlotte",13),(13328790,"Huet","Evan",15),(12659501,"Gay","Mathilde",15),
(16662790,"Paul","Léon",15),(14036221,"Clement","Romane",12),(13187132,"Laurent","Maëlle",14),
(15609771,"Andre","Angelina",15),(11935683,"Gonzalez","Sarah",14),(16758757,"Bertrand","Bruno",14),
(16579644,"Dupuy","Carla",12),(12153086,"Jacquet","Dimitri",14),(10477414,"Dumont","Antonin",13),
(10324805,"Garnier","Florentin",15),(11017981,"Riviere","Léa",13),(16689593,"Le roux","Anna",14),
(10811164,"Dumont","Dorian",13),(14463020,"Collet","Thomas",13),(15490670,"Cousin","Lily",14),
(14338823,"Leclerc","Cloé",12),(14969429,"Roy","Charlotte",13),(13288029,"Gonzalez","Jordan",14),

(11937024,"Roche","Kylian",24),(10995049,"Albert","Rose",25),(15923358,"Le roux","Maxence",21),
(14631201,"Duval","Capucine",24),(11855692,"Laurent","Loevan",22),(14916308,"Maillard","Samuel",25),
(13240948,"Francois","Pierre",21),(12746914,"Riviere","Agathe",23),(16482846,"Pereira","Valentine",22),
(13593115,"Rey","Pauline",22),(13896848,"Lefevre","Kyllian",22),(13348417,"Marty","Candice",25),
(11261161,"Noel","Adrian",24),(10267691,"Morin","Florian",22),(12562726,"Dumont","Justine",22),
(12026069,"Lecomte","Clément",25),(12330819,"Perrot","Mathilde",25),(11391537,"Leclerc","Adrian",21),
(11766327,"Garcia","Lauriane",23),(12350918,"Dupuy","Benjamin",24),(12168947,"Barbier","Julien",24),
(16159408,"Olivier","Tom",23),(16619722,"Laine","Sarah",24),(10158368,"Gay","Renaud",23),
(13501889,"Dumas","Adrian",24),(12207115,"Boulanger","Kyllian",25),(10874940,"Simon","Cédric",21),
(16251418,"Maillard","Émilie",23),(12980784,"Charpentier","Pauline",23),(13152654,"Nguyen","Erwan",23),
(12120284,"Dumas","Élisa",22),(13713193,"Brun","Yüna",25),(15225784,"Robert","Marine",25),
(16002761,"Marchal","Ethan",23),(15699008,"Herve","Bienvenue",24),(13716195,"Giraud","Lisa",24),
(12615629,"Garnier","Ethan",24),(12692880,"Lambert","Malo",25),(12932851,"Gonzalez","Salomé",25),
(11280228,"Vincent","Mehdi",22),(15757363,"Vasseur","Tristan",25),(13322709,"Rodriguez","Lamia",24),
(16175196,"Boucher","Timothée",23),(16136892,"Gay","Macéo",22),(11156181,"Remy","Edwige",23),

(14767726,"Barre","Mathieu",34),(15856876,"Benoit","Sarah",31),(13123892,"Philippe","Lutécia",34),
(13517795,"Masson","Hugo",31),(15540524,"Weber","Chaïma",31),(13146756,"Simon","Yanis",32),
(12785125,"Renaud","Clotilde",32),(13553172,"Leroux","Yanis",33),(15088340,"Marty","Éloïse",32),
(10145469,"Collin","Anna",33),(13906149,"Poirier","Candice",31),(13257491,"Bailly","Guillemette",32),
(10149945,"Simon","Amélie",33),(10593734,"Royer","Nolan",32),(13727002,"Louis","Anna",32),
(13015894,"Le roux","Mélissa",34),(11349860,"Laine","Lena",33),(13510718,"Fleury","Pauline",35),
(15332371,"Vasseur","Julia",34),(10329266,"Blanc","Jordan",32),(16694766,"Herve","Katell",34),
(12606514,"Philippe","Gaspard",34),(10986351,"Dubois","Julia",32),(12619655,"Vasseur","Clément",33),
(15082680,"Klein","Katell",33),(15224827,"Charles","Margaux",34),(10992728,"Bonnet","Grégory",35),
(12379180,"Garnier","Luna",32),(15587749,"Gaillard","Mattéo",31),(10426601,"Moulin","Nina",33),
(10569673,"Paul","Samuel",32),(13489410,"Poirier","Lucas",32),(15245780,"Daniel","Nicolas",31),
(12083434,"Klein","Capucine",32),(13351432,"Blanc","Louna",33),(15429015,"Le gall","Alicia",34),
(14309284,"Moreau","Lou",33),(11490062,"Lefevre","Carla",35),(13575579,"Collin","Lily",33),
(15491909,"Laine","Maelys",33),(11876004,"Leclerc","Anna",32),(13772797,"Lecomte","Bastien",34),
(13905959,"Giraud","Simon",32),(15519975,"Boulanger","Samuel",31),(10610279,"Collet","Anaïs",33),

(12375862,"Berger","Maxime",44),(12722837,"Roy","Evan",44),(15950601,"Duval","Nolan",41),
(14727972,"Leroux","Evan",43),(11400006,"Fournier","Maïlé",44),(10778680,"Gauthier","Bienvenue",44),
(12254361,"Martin","Katell",44),(11695371,"Roger","Davy",42),(11646354,"Pons","Kimberley",43),
(10333246,"Roux","Léonie",41),(16213055,"Louis","Julie",44),(13001848,"Leroy","Élouan",41),
(15449068,"Carre","Louise",44),(10853647,"Legrand","Alexis",41),(15855870,"Evrard","Mathieu",41),
(12605217,"Roux","Gilbert",42),(13330250,"Bouvier","Catherine",43),(13245143,"Sanchez","Yanis",43),
(12298599,"Roux","Gaspard",43),(15656281,"Carre","Killian",42),(16313277,"Guillaume","Syrine",44),
(12883084,"Renard","Manon",42),(11437470,"Bonnet","Grégory",44),(15879547,"Carre","Kevin",42),
(11267050,"Adam","Bruno",41),(14593416,"Renault","Noë",41),(16227090,"Roche","Kyllian",42),
(10119582,"Poulain","Gabin",44),(14018205,"Simon","Maéva",44),(11452262,"Muller","Anaïs",43),
(16379126,"Mathieu","Maëlle",44),(13062698,"Aubert","Paul",42),(16055916,"Charles","Louna",41),
(13353582,"Brunet","Mathéo",41),(16357625,"Vincent","Maelys",42),(14127787,"Mallet","Kimberley",43),

(12592195,"Philippe","Yüna",53),(10668537,"Klein","Maxime",51),(10802262,"Rousseau","Bastien",53),
(14209677,"Paris","Alexandre",53),(11315775,"Philippe","Enzo",51),(12731686,"Etienne","Laura",53),
(12634000,"Guillot","Robin",51),(13843428,"Perrot","Esteban",52),(13988496,"Morin","Jérémy",51),
(12614358,"Lucas","Titouan",51),(14395678,"Benoit","Victor",51),(11261025,"Mathieu","Éléna",53),
(10932732,"Lemoine","Nolan",51),(15248222,"Lemaire","Edwige",52),(16615599,"Leroux","Ethan",53),
(13096025,"Francois","Tatiana",53),(15671395,"Breton","Anthony",52),(13684823,"Morel","Gilbert",51),
(13755063,"Paul","Clara",51),(15413850,"Dumont","Paul",51),(12760079,"Chevalier","Killian",53),
(10903534,"Morin","Maïwenn",52),(13614530,"Weber","Katell",53),(10565853,"Etienne","Nina",51),
(11850444,"Rousseau","Félix",52),(11025258,"Leveque","Maxence",52),(14202387,"Roux","Léonard",53),

(15980768,"Laurent","Alicia",61),(15979229,"Meyer","Baptiste",62),(16283114,"Herve","Baptiste",62),
(16655049,"Nicolas","Charlotte",61),(15274818,"Schneider","Erwan",61),(15281053,"Maillard","Gilbert",61),
(12335170,"Charles","Anaïs",61),(11877578,"Gaillard","Nina",62),(14810802,"Herve","Marie",61),
(15800727,"Dubois","Davy",62),(16088322,"Lefebvre","Valentine",62),(10679301,"Deschamps","Robin",62),
(10370168,"Rousseau","Julien",62),(11686897,"Rousseau","Mélissa",62),(15631171,"Renault","Lucas",61),
(14344803,"Garcia","Léane",62),(13181153,"Mercier","Thomas",61),(13351689,"Louis","Clotilde",61),
(15721330,"Nicolas","Manon",61),(10303453,"Paul","Carla",61),(15281362,"Nicolas","Ethan",61),
(11480621,"Renault","Victor",61),(14372431,"Faure","Rémi",62),(13770005,"Gay","Maelys",61);


######################################
/* Désignation des chefs du service */
######################################

UPDATE service SET chef = CASE 	WHEN idService = 11 THEN 10000001
								WHEN idService = 21 THEN 15923358
                                WHEN idService = 31 THEN 15856876
                                WHEN idService = 41 THEN 15950601
                                WHEN idService = 51 THEN 10668537
                                WHEN idService = 61 THEN 15980768
                                WHEN idService = 12 THEN 15197983
                                WHEN idService = 22 THEN 11855692
                                WHEN idService = 32 THEN 13146756
                                WHEN idService = 42 THEN 12605217
                                WHEN idService = 52 THEN 11025258
                                WHEN idService = 62 THEN 15979229
                                WHEN idService = 13 THEN 16079461
                                WHEN idService = 23 THEN 12746914
                                WHEN idService = 33 THEN 13553172
                                WHEN idService = 43 THEN 14727972
                                WHEN idService = 53 THEN 12592195
                                WHEN idService = 14 THEN 11935683
                                WHEN idService = 24 THEN 11937024
                                WHEN idService = 34 THEN 14767726
                                WHEN idService = 44 THEN 12375862
                                WHEN idService = 15 THEN 15550461
                                WHEN idService = 25 THEN 10995049
                                WHEN idService = 35 THEN 13510718
                                END;
                                
################################################
/* Création de 600 malades via le fichier csv */  
################################################                               
LOAD DATA LOCAL INFILE 'A METTRE LE CHEMIN DU FICHIER ICI/myrawmalade.csv'
INTO TABLE malade
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

############################################################
/* Lecture du fichier txt qui contient 14.297 médicaments */
############################################################
/* téltéchargé depuis gouv.fr */
/* Il y aura un avertissement de type donnée tronquée bien que j'aie reservé
250 octets pour le libellé de medicament, à cause d'un nom de médicament trop 
trop long où les gens voulaient mettre toute la notice là-dedans ! */
LOAD DATA LOCAL INFILE 'A METTRE LE CHEMIN DU FICHIER ICI/CIS_bdpm.txt' /* Ça prend une minute ! */
INTO TABLE medicament 
CHARACTER SET latin1
FIELDS TERMINATED BY '\t' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(@col1, @col2, @ignore, @ignore, @ignore, @ignore, @ignore, @ignore, @ignore, @ignore, @ignore, @ignore)
SET idMedicament=@col1, libelle=@col2;


#################################################################################
/* Création de plus de 4.000 ordonnances via la fusion de medecin et de malade */
#################################################################################
/* J'ai de façon qu'un médecin ne soigne que les malades de son propre service.
Pourtant, le jumelage au sein d'un service n'est pas fait de façon aléatoire. C'est 
plutôt chaque malade a été soigné une fois par chaque médecin du service. Seule les 
dates de consultation sont aléatoires. Mais comme ces données sont juste conçues pour
tester la compatibilité des attributs et des tables, on les acceptera. */  

SET @MINidOrdonnance = 100000000;
SET @MAXidOrdonnance = 200000000;
SET @MINdate = '2014-12-07';
SET @MAXdate = '2016-12-07';

INSERT IGNORE INTO ordonnance
SELECT FLOOR(@MINidOrdonnance + (@MAXidOrdonnance - @MINidOrdonnance)*RAND()), 
DATE_ADD(@MINdate, INTERVAL FLOOR(RAND() * DATEDIFF(@MAXdate, @MINdate)) DAY),
idMalade, matricule 
FROM medecin INNER JOIN malade WHERE specialite = FLOOR(chambre/100);

#####################################################################
/* Enfin, saisie de 2 instructions à titre illustratif pour terminer.
#####################################################################
/* Maintenant j'en ai marre de générer avec les fonctions de MySQL dix milles voire cent
milles diverses chaînes de caractères pour posologie et dosage... mais en gros, au moins
une des techniques précédentes va marcher ! */
/* Encore une fois, la durée de la prise de médicament est stocké comme une date, celle
jusqu'à laquelle le malade doit en prendre */
INSERT IGNORE ordonnance VALUES (888, '2016-12-06', 9995124, 12692880);
INSERT instruction VALUES 
(888, 62869109, '1 comprimé avant chaque repas', 'orale', '2016-12-29', 1, NULL),
(888, 64332894, '1 fois le matin 1 fois le soir', 'cutanée', '2016-12-14', 0, 
'Prend ton Actimel et finis d''abord ton projet de base de données !'); 

					



