DELETE FROM typy;
DELETE FROM gatunki;
DELETE FROM miasta;
DELETE FROM regiony;
DELETE FROM umiejetnosci;
DELETE FROM gatunki_regiony;
DELETE FROM gatunki_umiejetnosci;
DELETE FROM gymy;
DELETE FROM pokemony;
DELETE FROM przedmioty;
DELETE FROM trenerzy;
DELETE FROM typy_przedmiotow;
DELETE FROM walki;

-- enum
INSERT INTO `typy` VALUES (1,'Grass'),
                          (2,'Fire'),
                          (3,'Water'),
                          (4,'Bug'),
                          (5,'Normal'),
                          (6,'Poison'),
                          (7,'Electric'),
                          (8,'Ground'),
                          (9,'Fairy'),
                          (10,'Fighting'),
                          (11,'Psychic'),
                          (12,'Rock'),
                          (13,'Ghost'),
                          (14,'Ice'),
                          (15,'Dragon'),
                          (16,'Dark'),
                          (17,'Steel'),
                          (18,'Flying');

INSERT INTO `gatunki` VALUES (1,'Bulbasaur',1,6,45,49,49,45,0, (SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur")),
                             (2,'Ivysaur',1,6,60,62,63,60,0, (SELECT gatunek_id FROM gatunki WHERE nazwa="Venusaur" )),
                             (3,'Venusaur',1,6,80,82,83,80,0,NULL),
                             (4,'Charmander',2,NULL,39,52,43,65,0, (SELECT gatunek_id FROM gatunki WHERE nazwa="Charmeleon")),
                             (5,'Charmeleon',2,NULL,58,64,58,80,0,NULL);

INSERT INTO `regiony` VALUES (1,'woj. dolnośląskie'),
                             (2,'woj. kujawsko-pomorskie'),
                             (3,'woj. lubelskie'),
                             (4,'woj. lubuskie'),
                             (5,'woj. łódzkie'),
                             (6,'woj. małopolskie'),
                             (7,'woj. mazowieckie'),
                             (8,'woj. opolskie'),
                             (9,'woj. podkarpackie'),
                             (10,'woj. podlaskie'),
                             (11,'woj. pomorskie'),
                             (12,'woj. śląskie'),
                             (13,'woj. świętokrzyskie'),
                             (14,'woj. warmińsko-mazurskie'),
                             (15,'woj. wielkopolskie'),
                             (16,'woj. zachodniopomorskie');

INSERT INTO `miasta` VALUES (1,(SELECT region_id FROM regiony WHERE nazwa="woj. śląskie"),              'Katowice'),
                            (2,(SELECT region_id FROM regiony WHERE nazwa="woj. dolnośląskie"),         'Wrocław'),
                            (3,(SELECT region_id FROM regiony WHERE nazwa="woj. podlaskie"),            'Białystok'),
                            (4,(SELECT region_id FROM regiony WHERE nazwa="woj. wielkopolskie"),        'Poznań'),
                            (5,(SELECT region_id FROM regiony WHERE nazwa="woj. zachodniopomorskie"),   'Szczecin'),
                            (6,(SELECT region_id FROM regiony WHERE nazwa="woj. lubelskie"),            'Lublin'),
                            (7,(SELECT region_id FROM regiony WHERE nazwa="woj. łódzkie"),              'Łódź');


INSERT INTO `umiejetnosci` VALUES (1,NULL,'stench','Has a 10% chance of making target Pokémon [flinch]{mechanic:flinch} with each hit.'),
                                  (2,NULL,'drizzle','Summons [rain]{mechanic:rain} that lasts indefinitely upon entering battle.'),
                                  (3,NULL,'speed-boost','Raises [Speed]{mechanic:speed} one [stage]{mechanic:stat-modifier} after each turn.'),
                                  (4,NULL,'battle-armor','Protects against [critical hits]{mechanic:critical-hit}.'),
                                  (5,NULL,'sturdy','Prevents being KOed from full [HP]{mechanic:hp}, leaving 1 HP instead.  Protects against the one-hit KO moves regardless of HP.'),
                                  (6,NULL,'damp','Prevents []{move:self-destruct}, []{move:explosion}, and []{ability:aftermath} from working while the Pokémon is in battle.'),
                                  (7,NULL,'limber','Prevents [paralysis]{mechanic:paralysis}.'),
                                  (8,NULL,'sand-veil','Increases [evasion]{mechanic:evasion} to 1.25× during a [sandstorm]{mechanic:sandstorm}.  Protects against sandstorm damage.'),
                                  (9,NULL,'static','Has a 30% chance of [paralyzing]{mechanic:paralysis} attacking Pokémon on contact.'),
                                  (10,NULL,'volt-absorb','Absorbs []{type:electric} moves, healing for 1/4 max [HP]{mechanic:hp}.'),
                                  (11,NULL,'water-absorb','Absorbs []{type:water} moves, healing for 1/4 max [HP]{mechanic:hp}.'),
                                  (12,NULL,'oblivious','Prevents [infatuation]{mechanic:infatuation} and protects against []{move:captivate}.'),
                                  (13,NULL,'cloud-nine','Negates all effects of [weather]{mechanic:weather}, but does not prevent the weather itself.'),
                                  (14,NULL,'compound-eyes','Increases moves [accuracy]{mechanic:accuracy} to 1.3×.'),
                                  (15,NULL,'insomnia','Prevents [sleep]{mechanic:sleep}.');

INSERT INTO `gatunki_regiony` VALUES ((SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"), ((SELECT region_id FROM regiony WHERE nazwa="woj. dolnośląskie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"), ((SELECT region_id FROM regiony WHERE nazwa="woj. łódzkie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),   ((SELECT region_id FROM regiony WHERE nazwa="woj. pomorskie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Venusaur"),  ((SELECT region_id FROM regiony WHERE nazwa="woj. podlaskie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmander"),((SELECT region_id FROM regiony WHERE nazwa="woj. zachodniopomorskie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmander"),((SELECT region_id FROM regiony WHERE nazwa="woj. wielkopolskie"))),
                                     ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmeleon"),((SELECT region_id FROM regiony WHERE nazwa="woj. dolnośląskie")));

INSERT INTO `gatunki_umiejetnosci` VALUES ((SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="stench")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="limber")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="drizzle")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="volt-absorb")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Venusaur"),   (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="damp")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmander"), (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="water-absorb")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmander"), (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="oblivious")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmeleon"), (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="insomnia")),
                                          ((SELECT gatunek_id FROM gatunki WHERE nazwa="Charmeleon"), (SELECT umiejetnosc_id FROM umiejetnosci WHERE nazwa="compound-eyes"));

INSERT INTO `gymy` VALUES (1,  (SELECT miasto_id FROM miasta WHERE nazwa="Lublin"),"oficyna 1903 - 1908"),
                          (2,  (SELECT miasto_id FROM miasta WHERE nazwa="Łódź"),"cmentarz wojenny z I wojny światowej 1914 - 1915"),
                          (3,  (SELECT miasto_id FROM miasta WHERE nazwa="Szczecin"),"park 2. poł. XIX w."),
                          (4,  (SELECT miasto_id FROM miasta WHERE nazwa="Lublin"),"kościół pw. Matki Boskiej Bolesnej 1871 - 1883"),
                          (5,  (SELECT miasto_id FROM miasta WHERE nazwa="Wrocław"),"brama XVIII w."),
                          (6,  (SELECT miasto_id FROM miasta WHERE nazwa="Szczecin"),"stodoła pocz. XIX w."),
                          (7,  (SELECT miasto_id FROM miasta WHERE nazwa="Wrocław"),"budynek gospodarczy 1873 - 1877"),
                          (8,  (SELECT miasto_id FROM miasta WHERE nazwa="Łódź"),"park"),
                          (9,  (SELECT miasto_id FROM miasta WHERE nazwa="Wrocław"),"kamienica 1898 r."),
                          (10, (SELECT miasto_id FROM miasta WHERE nazwa="Katowice"),"dzwonnica 1905 - 1909"),
                          (11, (SELECT miasto_id FROM miasta WHERE nazwa="Wrocław"),"katownia XVII w."),
                          (12, (SELECT miasto_id FROM miasta WHERE nazwa="Poznań"),"cerkiew prawosławna, ob. kościół rzymskokatolicki pw. św. Stanisława Kostki 1889 - 1890"),
                          (13, (SELECT miasto_id FROM miasta WHERE nazwa="Białystok"),"kaplica, ob. kościół filialny pw. Siedmiu Boleści Najświętszej Marii Panny 1725 - 1750");

INSERT INTO `trenerzy` VALUES (1,'franklin', (SELECT gym_id FROM gymy WHERE nazwa="oficyna 1903 - 1908")),
                              (2,'jerrie90', (SELECT gym_id FROM gymy WHERE nazwa="cmentarz wojenny z I wojny światowej 1914 - 1915")),
                              (3,'guilbert', (SELECT gym_id FROM gymy WHERE nazwa="park 2. poł. XIX w.")),
                              (4,'aleen38',  (SELECT gym_id FROM gymy WHERE nazwa="kościół pw. Matki Boskiej Bolesnej 1871 - 1883")),
                              (5,'ingar',    (SELECT gym_id FROM gymy WHERE nazwa="park")),
                              (6,'joey',     (SELECT gym_id FROM gymy WHERE nazwa="brama XVIII w.")),
                              (7,'nichole',  (SELECT gym_id FROM gymy WHERE nazwa="kamienica 1898 r.")),
                              (8,'liza',     (SELECT gym_id FROM gymy WHERE nazwa="budynek gospodarczy 1873 - 1877")),
                              (9,'mag',      (SELECT gym_id FROM gymy WHERE nazwa="dzwonnica 1905 - 1909")),
                              (10,'percy51', (SELECT gym_id FROM gymy WHERE nazwa="oficyna 1903 - 1908")),
                              (11,'carolin', (SELECT gym_id FROM gymy WHERE nazwa="dzwonnica 1905 - 1909")),
                              (12,'codi',    (SELECT gym_id FROM gymy WHERE nazwa="cerkiew prawosławna, ob. kościół rzymskokatolicki pw. św. Stanisława Kostki 1889 - 1890")),
                              (13,'elle',    (SELECT gym_id FROM gymy WHERE nazwa="park"));

INSERT INTO `pokemony` VALUES (1,'Jacobo',40,0,   (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="franklin")),
                              (2,'Przemek',40,0,  (SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT trener_id FROM trenerzy WHERE nick="jerrie90")),
                              (3,'Memento',40,0,  (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="guilbert")),
                              (4,'Frodo',40,0,    (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="joey")),
                              (5,'Maciek',40,0,   (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="nichole")),
                              (6,'Janek',40,0,    (SELECT gatunek_id FROM gatunki WHERE nazwa="Charmeleon"), (SELECT trener_id FROM trenerzy WHERE nick="liza")),
                              (7,'Kulka',40,0,    (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="mag")),
                              (8,'Azor',40,0,     (SELECT gatunek_id FROM gatunki WHERE nazwa="Charmander"), (SELECT trener_id FROM trenerzy WHERE nick="percy51")),
                              (9,'Johnny',40,0,   (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="elle")),
                              (10,'Jason',40,0,   (SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT trener_id FROM trenerzy WHERE nick="codi")),
                              (11,'Maria',40,0,   (SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT trener_id FROM trenerzy WHERE nick="aleen38")),
                              (12,'Mandril',40,0, (SELECT gatunek_id FROM gatunki WHERE nazwa="Venusaur"),   (SELECT trener_id FROM trenerzy WHERE nick="ingar")),
                              (13,'Eoeo',40,0,    (SELECT gatunek_id FROM gatunki WHERE nazwa="Ivysaur"),    (SELECT trener_id FROM trenerzy WHERE nick="carolin")),
                              (14,'Arek',40,0,    (SELECT gatunek_id FROM gatunki WHERE nazwa="Bulbasaur"),  (SELECT trener_id FROM trenerzy WHERE nick="codi"));

INSERT INTO `typy_przedmiotow` VALUES (1,'master-ball',0,  'Master ball, holds up to 90 Pokemon!'),
                                      (2,'ultra-ball',800, 'Ultra  ball, holds up to 180 Pokemon!'),
                                      (3,'great-ball',1900,'Great  ball, holds up to 360 Pokemon!'),
                                      (4,'poke-ball',200,  'Regular Pokeball, holds up to 5 Pokemon'),
                                      (5,'safari-ball',0,NULL),
                                      (6,'net-ball',1000,NULL),
                                      (7,'dive-ball',1000,NULL),
                                      (8,'nest-ball',1000,NULL),
                                      (9,'repeat-ball',1000,NULL),
                                      (10,'timer-ball',1000,NULL),
                                      (11,'luxury-ball',1000,NULL),
                                      (12,'premier-ball',20,NULL),
                                      (13,'dusk-ball',1000,NULL),
                                      (14,'heal-ball',300,NULL),
                                      (15,'quick-ball',1000,NULL),
                                      (16,'cherish-ball',0,NULL),
                                      (17,'potion',200,NULL),
                                      (18,'antidote',200,NULL),
                                      (19,'burn-heal',300,NULL),
                                      (20,'ice-heal',100,NULL),
                                      (21,'awakening',100,NULL),
                                      (22,'paralyze-heal',300,NULL),
                                      (23,'full-restore',3000,NULL);

INSERT INTO `przedmioty` VALUES (1,  (SELECT trener_id FROM trenerzy WHERE nick="franklin"), (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="master-ball") ),
                                (2,  (SELECT trener_id FROM trenerzy WHERE nick="franklin"), (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="potion") ),
                                (3,  (SELECT trener_id FROM trenerzy WHERE nick="jerrie90"), (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="ultra-ball") ),
                                (4,  (SELECT trener_id FROM trenerzy WHERE nick="guilbert"), (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="repeat-ball") ),
                                (5,  (SELECT trener_id FROM trenerzy WHERE nick="joey"),     (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="potion") ),
                                (6,  (SELECT trener_id FROM trenerzy WHERE nick="nichole"),  (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="cherish-ball") ),
                                (7,  (SELECT trener_id FROM trenerzy WHERE nick="nichole"),  (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="potion") ),
                                (8,  (SELECT trener_id FROM trenerzy WHERE nick="liza"),     (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="antidote") ),
                                (9,  (SELECT trener_id FROM trenerzy WHERE nick="mag"),      (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="quick-ball") ),
                                (10, (SELECT trener_id FROM trenerzy WHERE nick="mag"),      (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="antidote") ),
                                (11, (SELECT trener_id FROM trenerzy WHERE nick="mag"),      (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="full-restore") ),
                                (12, (SELECT trener_id FROM trenerzy WHERE nick="percy51"),  (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="ice-heal") ),
                                (13, (SELECT trener_id FROM trenerzy WHERE nick="elle"),     (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="awakening") ),
                                (14, (SELECT trener_id FROM trenerzy WHERE nick="codi"),     (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="paralyze-heal") ),
                                (15, (SELECT trener_id FROM trenerzy WHERE nick="aleen38"),  (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="full-restore") ),
                                (16, (SELECT trener_id FROM trenerzy WHERE nick="ingar"),    (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="net-ball") ),
                                (17, (SELECT trener_id FROM trenerzy WHERE nick="codi"),     (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="poke-ball") ),
                                (18, (SELECT trener_id FROM trenerzy WHERE nick="carolin"),  (SELECT typ_przedmiotu_id FROM typy_przedmiotow WHERE nazwa="dusk-ball") );

INSERT INTO `walki` VALUES (1,'2021-12-27',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Przemek") , (SELECT pokemon_id FROM pokemony WHERE nazwa="Jacobo")),
                           (2,'2022-01-07',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Jacobo") ,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Maria")),
                           (3,'2022-01-02',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Mandril") , (SELECT pokemon_id FROM pokemony WHERE nazwa="Arek")),
                           (4,'2021-03-17',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Jason") ,   (SELECT pokemon_id FROM pokemony WHERE nazwa="Maciek")),
                           (5,'2022-01-01',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Maria") ,   (SELECT pokemon_id FROM pokemony WHERE nazwa="Eoeo")),
                           (6,'2022-01-03',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Arek") ,    (SELECT pokemon_id FROM pokemony WHERE nazwa="Johnny")),
                           (7,'2022-01-04',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Eoeo") ,    (SELECT pokemon_id FROM pokemony WHERE nazwa="Kulka")),
                           (8,'2022-01-02',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Johnny") ,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Memento")),
                           (9,'2021-05-22',1,4,  (SELECT pokemon_id FROM pokemony WHERE nazwa="Azor") ,    (SELECT pokemon_id FROM pokemony WHERE nazwa="Kulka")),
                           (10,'2021-05-30',1,4, (SELECT pokemon_id FROM pokemony WHERE nazwa="Kulka") ,   (SELECT pokemon_id FROM pokemony WHERE nazwa="Przemek")),
                           (11,'2021-09-13',1,4, (SELECT pokemon_id FROM pokemony WHERE nazwa="Memento") , (SELECT pokemon_id FROM pokemony WHERE nazwa="Maciek"));
