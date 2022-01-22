-- single table queries
SELECT nazwa, typ, typ_2 FROM gatunki;
SELECT nazwa, miasto_id FROM gymy;
SELECT * FROM miasta;
SELECT nazwa, poziom, shiny FROM pokemony;
SELECT trener_id FROM przedmioty;
SELECT * FROM regiony;
SELECT * FROM trenerzy;
SELECT typ FROM typy;
SELECT nazwa, opis FROM umiejetnosci;
SELECT data, zwyciezca FROM walki;

-- multi table queries, arithmetic operators, groups, aggregation
SELECT pokemony.nazwa, trenerzy.nick FROM pokemony INNER JOIN trenerzy ON pokemony.trener_id = trenerzy.trener_id;
SELECT pokemony.nazwa,pokemony.trener_id,trenerzy.trener_id,trenerzy.nick FROM pokemony INNER JOIN trenerzy ON pokemony.trener_id = trenerzy.trener_id;
SELECT * FROM gatunki GROUP BY typ;
SELECT nazwa,cena FROM typy_przedmiotow WHERE cena < 300;
SELECT nazwa,cena FROM typy_przedmiotow WHERE cena = 100;
SELECT g.nazwa,u.nazwa FROM gatunki AS g INNER JOIN gatunki_umiejetnosci AS gu ON g.gatunek_id = gu.gatunek_id INNER JOIN umiejetnosci AS u ON gu.umiejetnosc_id = u.umiejetnosc_id;
SELECT regiony.nazwa,miasta.nazwa FROM regiony LEFT JOIN miasta ON miasta.region_id = regiony.region_id;
SELECT nazwa FROM gymy WHERE miasto_id = (SELECT miasto_id FROM miasta WHERE nazwa = "Lublin");
SELECT * FROM pokemony WHERE poziom > 30 AND poziom < 50;
SELECT * FROM pokemony WHERE nazwa LIKE "Mar%" ;

-- updates
UPDATE pokemony SET poziom = 20 WHERE nazwa = "Jacobo";
UPDATE pokemony SET nazwa = "Maciej" WHERE trener_id = (SELECT trener_id FROM trenerzy WHERE nick = "guilbert");
UPDATE typy_przedmiotow SET opis = "This is an item" WHERE opis IS NULL;
UPDATE typy_przedmiotow SET cena = cena / 2 WHERE cena >= 1000;
UPDATE miasta SET nazwa = "Jakiesmiasto" WHERE region_id = (SELECT region_id FROM regiony WHERE nazwa = "woj. lubelskie");
UPDATE walki SET pokemon_id_1 = (SELECT pokemon_id FROM pokemony WHERE nazwa = "Przemek") WHERE zwyciezca = 0;
UPDATE trenerzy SET nick = nick || "123";
UPDATE gatunki_regiony SET region_id = 14 WHERE region_id = 15;
UPDATE gatunki_regiony SET region_id = region_id + 1 WHERE region_id < 5;
UPDATE gymy SET miasto_id = (SELECT miasto_id FROM miasta WHERE nazwa = "Wrocław") WHERE nazwa LIKE "%stodoła%";
