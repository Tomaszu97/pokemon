CREATE TABLE `gatunki` (
  `gatunek_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `nazwa` varchar(255) NOT NULL
,  `typ` integer NOT NULL
,  `typ_2` integer DEFAULT NULL
,  `hp` integer NOT NULL
,  `atak` integer NOT NULL
,  `obrona` integer NOT NULL
,  `szybkosc` integer NOT NULL
,  `legendarny` integer NOT NULL
,  `ewoluuje_w` integer DEFAULT NULL
,  CONSTRAINT `FKgatunki208230` FOREIGN KEY (`ewoluuje_w`) REFERENCES `gatunki` (`gatunek_id`)
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE `gatunki_regiony` (
  `gatunek_id` integer NOT NULL
,  `region_id` integer NOT NULL
,  PRIMARY KEY (`gatunek_id`,`region_id`)
,  CONSTRAINT `FKgatunki_re297328` FOREIGN KEY (`gatunek_id`) REFERENCES `gatunki` (`gatunek_id`)
,  CONSTRAINT `FKgatunki_re987298` FOREIGN KEY (`region_id`) REFERENCES `regiony` (`region_id`)
);
CREATE TABLE `gatunki_umiejetnosci` (
  `gatunek_id` integer NOT NULL
,  `umiejetnosc_id` integer NOT NULL
,  PRIMARY KEY (`gatunek_id`,`umiejetnosc_id`)
,  CONSTRAINT `FKgatunki_um284781` FOREIGN KEY (`gatunek_id`) REFERENCES `gatunki` (`gatunek_id`)
,  CONSTRAINT `FKgatunki_um808043` FOREIGN KEY (`umiejetnosc_id`) REFERENCES `umiejetnosci` (`umiejetnosc_id`)
);
CREATE TABLE `gymy` (
  `gym_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `miasto_id` integer NOT NULL
,  `nazwa` varchar(255) DEFAULT NULL
,  CONSTRAINT `FKgymy507717` FOREIGN KEY (`miasto_id`) REFERENCES `miasta` (`miasto_id`)
);
CREATE TABLE `miasta` (
  `miasto_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `region_id` integer NOT NULL
,  `nazwa` varchar(255) DEFAULT NULL
,  CONSTRAINT `FKmiasta389868` FOREIGN KEY (`region_id`) REFERENCES `regiony` (`region_id`)
);
CREATE TABLE `pokemony` (
  `pokemon_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `nazwa` varchar(255) DEFAULT NULL
,  `poziom` integer NOT NULL
,  `shiny` integer NOT NULL DEFAULT 0
,  `gatunek_id` integer NOT NULL
,  `trener_id` integer DEFAULT NULL
,  CONSTRAINT `FKpokemony397913` FOREIGN KEY (`gatunek_id`) REFERENCES `gatunki` (`gatunek_id`)
,  CONSTRAINT `FKpokemony846429` FOREIGN KEY (`trener_id`) REFERENCES `trenerzy` (`trener_id`)
);
CREATE TABLE `przedmioty` (
  `przedmiot_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `trener_id` integer DEFAULT NULL
,  `typ_przedmiotu_id` integer NOT NULL
,  CONSTRAINT `FKprzedmioty156732` FOREIGN KEY (`typ_przedmiotu_id`) REFERENCES `typy_przedmiotow` (`typ_przedmiotu_id`)
,  CONSTRAINT `FKprzedmioty66932` FOREIGN KEY (`trener_id`) REFERENCES `trenerzy` (`trener_id`)
);
CREATE TABLE `regiony` (
  `region_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `nazwa` varchar(255) DEFAULT NULL
);
CREATE TABLE `trenerzy` (
  `trener_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `nick` varchar(255) DEFAULT NULL
,  `gym_id` integer NOT NULL
,  CONSTRAINT `FKtrenerzy972088` FOREIGN KEY (`gym_id`) REFERENCES `gymy` (`gym_id`)
);
CREATE TABLE `typy` (
  `typ_id` integer NOT NULL
,  `typ` varchar(255) NOT NULL
,  PRIMARY KEY (`typ_id`)
);
CREATE TABLE `typy_przedmiotow` (
  `typ_przedmiotu_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `nazwa` varchar(255) NOT NULL
,  `cena` integer NOT NULL
,  `opis` varchar(255) DEFAULT NULL
);
CREATE TABLE `umiejetnosci` (
  `umiejetnosc_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `typ` integer DEFAULT NULL
,  `nazwa` varchar(255) NOT NULL DEFAULT '0'
,  `opis` varchar(512) DEFAULT NULL
);
CREATE TABLE `walki` (
  `walka_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `data` date NOT NULL
,  `zwyciezca` integer DEFAULT NULL
,  `punkty` integer DEFAULT NULL
,  `pokemon_id_1` integer NOT NULL
,  `pokemon_id_2` integer NOT NULL
,  CONSTRAINT `FKwalki223523` FOREIGN KEY (`pokemon_id_2`) REFERENCES `pokemony` (`pokemon_id`)
,  CONSTRAINT `FKwalki223524` FOREIGN KEY (`pokemon_id_1`) REFERENCES `pokemony` (`pokemon_id`)
);
CREATE INDEX "idx_przedmioty_FKprzedmioty66932" ON "przedmioty" (`trener_id`);
CREATE INDEX "idx_przedmioty_FKprzedmioty156732" ON "przedmioty" (`typ_przedmiotu_id`);
CREATE INDEX "idx_miasta_FKmiasta389868" ON "miasta" (`region_id`);
CREATE INDEX "idx_trenerzy_FKtrenerzy972088" ON "trenerzy" (`gym_id`);
CREATE INDEX "idx_gatunki_FKgatunki208230" ON "gatunki" (`ewoluuje_w`);
CREATE INDEX "idx_gatunki_regiony_FKgatunki_re987298" ON "gatunki_regiony" (`region_id`);
CREATE INDEX "idx_pokemony_FKpokemony846429" ON "pokemony" (`trener_id`);
CREATE INDEX "idx_pokemony_FKpokemony397913" ON "pokemony" (`gatunek_id`);
CREATE INDEX "idx_gymy_FKgymy507717" ON "gymy" (`miasto_id`);
CREATE INDEX "idx_gatunki_umiejetnosci_FKgatunki_um808043" ON "gatunki_umiejetnosci" (`umiejetnosc_id`);
CREATE INDEX "idx_walki_FKwalki223524" ON "walki" (`pokemon_id_1`);
CREATE INDEX "idx_walki_FKwalki223523" ON "walki" (`pokemon_id_2`);
