### Task 1

<pre>map=# create table country (id  serial primary key, name varchar(50), population int, last_status_change date);
CREATE TABLE
map=# INSERT INTO country(name, population, last_status_change) VALUES
  (&apos;Germany&apos;, 83190556, &apos;1990-10-03&apos;),
  (&apos;France&apos;, 67413000, &apos;1958-10-04&apos;),
  (&apos;Namibia&apos;, 2550226, &apos;1990-03-21&apos;),
  (&apos;Uruguay&apos;, 3518552, &apos;1830-07-18&apos;),
  (&apos;Kazakhstan&apos;, 18711560, &apos;1995-08-30&apos;)
;
</pre>

<pre>map=# select * from country;
 id |    name    | population | last_status_change 
----+------------+------------+--------------------
  1 | Germany    |   83190556 | 1990-10-03
  2 | France     |   67413000 | 1958-10-04
  3 | Namibia    |    2550226 | 1990-03-21
  4 | Uruguay    |    3518552 | 1830-07-18
  5 | Kazakhstan |   18711560 | 1995-08-30
(5 rows)</pre>

### Task 2

<pre>map=# select * from city;
 id |    name    |  area  | is_capital | country_id 
----+------------+--------+------------+------------
  1 | Nur-Sultan |  810.2 | t          |          5
  2 | Montevideo |    201 | t          |          4
  3 | Florida    |    8.2 | f          |          4
  4 | Windhoek   |   5133 | t          |          3
  5 | Swakopmund |  196.3 | f          |          3
  6 | Marseille  | 240.62 | f          |          2
  7 | Berlin     |  891.7 | t          |          1
(7 rows)
</pre>

### Task 3

<pre>map=# select * from city join country on city.country_id=country.id;
 id |    name    |  area  | is_capital | country_id | id |    name    | population | last_status_change 
----+------------+--------+------------+------------+----+------------+------------+--------------------
  1 | Nur-Sultan |  810.2 | t          |          5 |  5 | Kazakhstan |   18711560 | 1995-08-30
  2 | Montevideo |    201 | t          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
  3 | Florida    |    8.2 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
  4 | Windhoek   |   5133 | t          |          3 |  3 | Namibia    |    2550226 | 1990-03-21
  5 | Swakopmund |  196.3 | f          |          3 |  3 | Namibia    |    2550226 | 1990-03-21
  6 | Marseille  | 240.62 | f          |          2 |  2 | France     |   67413000 | 1958-10-04
  7 | Berlin     |  891.7 | t          |          1 |  1 | Germany    |   83190556 | 1990-10-03
  8 | Salto      |   14.2 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
  9 | Rio Negro  |    9.3 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
 10 | Maldonado  |    4.8 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
 11 | Flores     |    5.1 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
 12 | Paris      |  105.4 | t          |          2 |  2 | France     |   67413000 | 1958-10-04
 13 | Lyon       |  47.87 | f          |          2 |  2 | France     |   67413000 | 1958-10-04
 14 | Toulouse   |  118.3 | f          |          2 |  2 | France     |   67413000 | 1958-10-04
 15 | Nice       |  71.92 | f          |          2 |  2 | France     |   67413000 | 1958-10-04
 16 | Hamburg    | 755.22 | f          |          1 |  1 | Germany    |   83190556 | 1990-10-03
 17 | Munich     | 310.71 | f          |          1 |  1 | Germany    |   83190556 | 1990-10-03
 18 | Frankfurt  | 248.31 | f          |          1 |  1 | Germany    |   83190556 | 1990-10-03
(18 rows)</pre>

### Task 4

<pre>map=# select * from city where city.country_id=(select id from country where name = &apos;Germany&apos;);
 id |   name    |  area  | is_capital | country_id 
----+-----------+--------+------------+------------
  7 | Berlin    |  891.7 | t          |          1
 16 | Hamburg   | 755.22 | f          |          1
 17 | Munich    | 310.71 | f          |          1
 18 | Frankfurt | 248.31 | f          |          1
(4 rows)</pre>

### Task 5
<pre>map=# select country.name,city.name, city.area from country join city on city.country_id = country.id order by city.area asc limit 1 ; 
  name   |   name    | area 
---------+-----------+------
 Uruguay | Maldonado |  4.8
(1 row)</pre>

### Task 6
<pre>map=# SELECT country.name, city.name, city.area
FROM country
JOIN city ON city.country_id = country.id
WHERE city.is_capital = TRUE
ORDER BY city.area ASC
LIMIT 1;
  name  | name  | area  
--------+-------+-------
 France | Paris | 105.4
(1 row)</pre>

### Task 7
<pre>map=# SELECT city.name, country.name, country.population
FROM city
JOIN country ON city.country_id = country.id
WHERE city.is_capital = TRUE
ORDER BY country.population DESC
LIMIT 3;
    name    |    name    | population 
------------+------------+------------
 Berlin     | Germany    |   83190556
 Paris      | France     |   67413000
 Nur-Sultan | Kazakhstan |   18711560
(3 rows)
</pre>

### Task 8
<pre>map=# -- Delete Germany from the `country` table.
DELETE FROM country WHERE name = &apos;Germany&apos;;
-- List all the cities with all the fields.
SELECT city.id, city.name, city.area, city.is_capital, city.country_id
FROM city;
DELETE 1
 id |    name    |  area  | is_capital | country_id 
----+------------+--------+------------+------------
  1 | Nur-Sultan |  810.2 | t          |          5
  2 | Montevideo |    201 | t          |          4
  3 | Florida    |    8.2 | f          |          4
  4 | Windhoek   |   5133 | t          |          3
  5 | Swakopmund |  196.3 | f          |          3
  6 | Marseille  | 240.62 | f          |          2
  8 | Salto      |   14.2 | f          |          4
  9 | Rio Negro  |    9.3 | f          |          4
 10 | Maldonado  |    4.8 | f          |          4
 11 | Flores     |    5.1 | f          |          4
 12 | Paris      |  105.4 | t          |          2
 13 | Lyon       |  47.87 | f          |          2
 14 | Toulouse   |  118.3 | f          |          2
 15 | Nice       |  71.92 | f          |          2
  7 | Berlin     |  891.7 | t          |           
 16 | Hamburg    | 755.22 | f          |           
 17 | Munich     | 310.71 | f          |           
 18 | Frankfurt  | 248.31 | f          |           
(18 rows)</pre>

### Task 9
<pre>map=# INSERT INTO country(name, population, last_status_change, code) VALUES
  (&apos;Germany&apos;, 83190556, &apos;1990-10-03&apos;, &apos;DE&apos;),
  (&apos;France&apos;, 67413000, &apos;1958-10-04&apos;, &apos;FR&apos;),
  (&apos;Namibia&apos;, 2550226, &apos;1990-03-21&apos;, &apos;NA&apos;),
  (&apos;Uruguay&apos;, 3518552, &apos;1830-07-18&apos;, &apos;UY&apos;),
  (&apos;Kazakhstan&apos;, 18711560, &apos;1995-08-30&apos;, &apos;KZ&apos;),
  (&apos;Spain&apos;, 47450795, &apos;1986-01-01&apos;, &apos;ES&apos;),
  (&apos;Switzerland&apos;, 8570146, &apos;1848-09-12&apos;, &apos;CH&apos;),
  (&apos;Austria&apos;, 8935112, &apos;1995-01-01&apos;, &apos;AT&apos;)
;
INSERT 0 8
map=# INSERT INTO country(name, code) VALUES(&apos;Test unique&apos;, &apos;DE&apos;);
ERROR:  duplicate key value violates unique constraint &quot;country_code_key&quot;
DETAIL:  Key (code)=(DE) already exists.</pre>

### Task 10
<pre>map=# INSERT INTO country(name, code) VALUES(&apos;Test unique&apos;, &apos;DE&apos;);
ERROR:  duplicate key value violates unique constraint &quot;country_code_key&quot;
DETAIL:  Key (code)=(DE) already exists.
map=# CREATE TABLE language (
  code VARCHAR(2) PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
CREATE TABLE
map=# INSERT INTO language(name, code) VALUES
  (&apos;English&apos;, &apos;en&apos;),
  (&apos;German&apos;, &apos;de&apos;),
  (&apos;French&apos;, &apos;fr&apos;),
  (&apos;Afrikaans&apos;, &apos;af&apos;),
  (&apos;Spanish&apos;, &apos;es&apos;),
  (&apos;Kazakh&apos;, &apos;kk&apos;),
  (&apos;Russian&apos;, &apos;ru&apos;),
  (&apos;Italian&apos;, &apos;it&apos;),
  (&apos;Catalan&apos;, &apos;ca&apos;)
;
INSERT 0 9
map=# select name, code from language;
   name    | code 
-----------+------
 English   | en
 German    | de
 French    | fr
 Afrikaans | af
 Spanish   | es
 Kazakh    | kk
 Russian   | ru
 Italian   | it
 Catalan   | ca
(9 rows)

map=# insert into language (code, name) values(&apos;de&apos;, &apos;German&apos;);
ERROR:  duplicate key value violates unique constraint &quot;language_pkey&quot;
DETAIL:  Key (code)=(de) already exists.</pre>

### Task 11
<pre>map=# CREATE TABLE locale (
  name VARCHAR(255) NOT NULL,
  language_code VARCHAR(2) NOT NULL,
  country_code VARCHAR(2) NOT NULL,
  PRIMARY KEY (language_code, country_code)
);
CREATE TABLE
map=# INSERT INTO locale VALUES
  (&apos;German&apos;, &apos;de&apos;, &apos;DE&apos;),
  (&apos;Austrian&apos;, &apos;de&apos;, &apos;AT&apos;),
  (&apos;Swiss german&apos;, &apos;de&apos;, &apos;CH&apos;),
  (&apos;French&apos;, &apos;fr&apos;, &apos;FR&apos;),
  (&apos;Afrikaans&apos;, &apos;af&apos;, &apos;NA&apos;),
  (&apos;English (Namibia)&apos;, &apos;en&apos;, &apos;NA&apos;),
  (&apos;LATAM Spanish&apos;, &apos;es&apos;, &apos;UY&apos;),
  (&apos;Spanish&apos;, &apos;es&apos;, &apos;ES&apos;),
  (&apos;Kazakh&apos;, &apos;kk&apos;, &apos;KZ&apos;),
  (&apos;Russian&apos;, &apos;ru&apos;, &apos;KZ&apos;),
  (&apos;Italian&apos;, &apos;it&apos;, &apos;CH&apos;),
  (&apos;French&apos;, &apos;fr&apos;, &apos;CH&apos;),
  (&apos;Catalan&apos;, &apos;ca&apos;, &apos;ES&apos;)
;
INSERT 0 13
map=# INSERT INTO locale VALUES(&apos;Test primary&apos;, &apos;de&apos;, &apos;DE&apos;);
ERROR:  duplicate key value violates unique constraint &quot;locale_pkey&quot;
DETAIL:  Key (language_code, country_code)=(de, DE) already exists.</pre>

### Task 12
<pre>map=# SELECT locale.name AS Locale, country.name AS Country, language.name AS Language
FROM locale
JOIN country ON locale.country_code = country.code
JOIN language ON locale.language_code = language.code
ORDER BY language.name ASC;
      locale       |   country   | language  
-------------------+-------------+-----------
 Afrikaans         | Namibia     | Afrikaans
 Catalan           | Spain       | Catalan
 English (Namibia) | Namibia     | English
 French            | Switzerland | French
 French            | France      | French
 German            | Germany     | German
 Austrian          | Austria     | German
 Swiss german      | Switzerland | German
 Italian           | Switzerland | Italian
 Kazakh            | Kazakhstan  | Kazakh
 Russian           | Kazakhstan  | Russian
 Spanish           | Spain       | Spanish
 LATAM Spanish     | Uruguay     | Spanish
(13 rows)
</pre>
