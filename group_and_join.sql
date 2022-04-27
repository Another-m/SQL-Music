SELECT g.name as Name_genre, count(pg.id_genre) as quantity_perf FROM genre g INNER JOIN performergenre pg ON (g.id = pg.id_genre) GROUP BY g.name

SELECT count(*) FROM tracks t INNER JOIN albums a  ON (a.id = t.id_albums) WHERE year BETWEEN 2019 AND 2020
SELECT a.year, count(*) FROM tracks t INNER JOIN albums a  ON (a.id = t.id_albums) WHERE year BETWEEN 2019 AND 2020 GROUP BY a.year  /* Если условие подсчитать количество треков по каждому году*/

SELECT a.name as name_album, avg(t.length) FROM tracks t INNER JOIN albums a  ON (a.id = t.id_albums) GROUP by name_album

SELECT p.name as Name_performer, a.year FROM performer p INNER JOIN performeralbums pa ON (p.id = pa.id_performer) INNER JOIN albums a ON (pa.id_albums = a.id) WHERE a.year != 2020 ORDER BY Name_performer

SELECT c.name as Name_collection, p.name as Name_performer FROM collection c INNER JOIN collectiontracks ct ON (c.id = ct.id_collection) INNER JOIN tracks t ON (ct.id_tracks = t.id) INNER JOIN albums a ON (t.id_albums = a.id) INNER JOIN performeralbums pa ON (a.id = pa.id_albums) INNER JOIN performer p ON (p.id = pa.id_performer) WHERE p.name = 'Сатурн'

SELECT Name_Album, Name_Performer FROM (SELECT a.name as Name_Album, p.name as Name_Performer, count(p.id) as c1 FROM albums a INNER JOIN performeralbums pa ON (a.id = pa.id_albums) INNER JOIN performer p ON (p.id = pa.id_performer) INNER JOIN performergenre pg ON (p.id = pg.id_performer) GROUP BY a.name, p.name) as table1 WHERE c1 > 1

SELECT t.name FROM collection c INNER JOIN collectiontracks ct ON (c.id = ct.id_collection) FULL OUTER JOIN tracks t ON (ct.id_tracks = t.id) WHERE c.id is null order by t.id

SELECT p.name as Name_Performer, t.name as Name_track, length FROM tracks t INNER JOIN albums a ON (a.id = t.id_albums) INNER JOIN performeralbums pa ON (a.id = pa.id_albums) INNER JOIN performer p ON (p.id = pa.id_performer)  WHERE length = (SELECT MIN(length) FROM tracks)

UPDATE tracks SET id_albums = 5 WHERE id = 8; /* Перенесем один из треков в другой альбом, чтобы получить более точный результат*/
SELECT name FROM (SELECT a.id, a.name, count(t.id)  FROM tracks t INNER JOIN albums a ON (a.id = t.id_albums) group by a.id) as table3 WHERE count = (SELECT MIN(count) FROM (SELECT a.id, a.name, count(t.id)  FROM tracks t INNER JOIN albums a ON (a.id = t.id_albums) group by a.id) as table2);
