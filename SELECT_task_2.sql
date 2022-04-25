SELECT name, year FROM albums WHERE "year" = 2018
SELECT name, length FROM tracks ORDER BY length DESC limit 1
SELECT name, length FROM tracks WHERE "length" >= 210
SELECT name, year FROM collection WHERE "year" BETWEEN 2018 AND 2020
SELECT name FROM performer WHERE name NOT LIKE '% %'
SELECT name FROM tracks WHERE name LIKE '%мой%' or name like '%my%' or name like '%Мой%' or name like '%My%'
