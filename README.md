# Table Relationships

## Description

In this exercise, we will focus on creating tables with relationships and using more data types.

## Tasks

You can choose to execute the following tasks using the terminal or using DBeaver (or a combination).

In any case, all operations (except connecting to a database) must be done using SQL statements.

### Task 1

Create a new database named `map`.

In that database, create a table named `country` with the following fields:

- **id**: an Integer that should be created by default using a sequence and it should be declared as a primary key.
- **name**: a String representing the name of the country.
- **population**: an Integer representing the population of the country.
- **last_status_change**: a Date representing the last time the country changed its status (independence, unification,...).

Then, add 5 countries without specifying the `id` field.

Finally, select all fields in the table `country`.

**Your result should look similar to this:**

```
id |    name    | population | last_status_change
----+------------+------------+--------------------
 1 | Germany    |   83190556 | 1990-10-03
 2 | France     |   67413000 | 1958-10-04
 3 | Namibia    |    2550226 | 1990-03-21
 4 | Uruguay    |    3518552 | 1830-07-18
 5 | Kazakhstan |   18711560 | 1995-08-30
(5 rows)
```

> The field `id` should have been filled automatically with incremental values starting from `1`.

### Task 2

Now, create a table named `city` with the following fields:

- **id**: an Integer that should be created by default using a sequence and it should be declared as a primary key.
- **name**: a String representing the name of the city.
- **area**: a Decimal number representing the surface area of the municipality.
- **is_capital**: a Boolean indicating if the city is the capital of its country.
- **country_id**: an Integer with the id of the country in the `country` table. This should be a foreign key. If the country is deleted, this field should be set to `NULL`.

Once you execute the SQL statement to create the table, add 7 cities without defining the `id` field.

> You will need to manually check which `id` belongs to each country to fill the `country_id` field.

Finally, select all fields in the table `city`.

**Your result should look similar to this:**

```
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
```

### Task 3

Now, combine both tables showing all fields from both of them and using the primary and foreign keys to produce a list of cities and their countries.

**Your result should look similar to this:**

```
 id |    name    |  area  | is_capital | country_id | id |    name    | population | last_status_change
----+------------+--------+------------+------------+----+------------+------------+--------------------
  1 | Nur-Sultan |  810.2 | t          |          5 |  5 | Kazakhstan |   18711560 | 1995-08-30
  2 | Montevideo |    201 | t          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
  3 | Florida    |    8.2 | f          |          4 |  4 | Uruguay    |    3518552 | 1830-07-18
  4 | Windhoek   |   5133 | t          |          3 |  3 | Namibia    |    2550226 | 1990-03-21
  5 | Swakopmund |  196.3 | f          |          3 |  3 | Namibia    |    2550226 | 1990-03-21
  6 | Marseille  | 240.62 | f          |          2 |  2 | France     |   67413000 | 1958-10-04
  7 | Berlin     |  891.7 | t          |          1 |  1 | Germany    |   83190556 | 1990-10-03
(7 rows)
```

### Task 4

Now, execute the file [data.sql](data.sql) to load some sample data.

Produce a list of all German cities in the database.

> Do not write the country id `1` in the SQL.

**Your result should look like this:**

```
 id |   name    |  area  | is_capital | country_id | id |  name   | population | last_status_change
----+-----------+--------+------------+------------+----+---------+------------+--------------------
  7 | Berlin    |  891.7 | t          |          1 |  1 | Germany |   83190556 | 1990-10-03
 16 | Hamburg   | 755.22 | f          |          1 |  1 | Germany |   83190556 | 1990-10-03
 17 | Munich    | 310.71 | f          |          1 |  1 | Germany |   83190556 | 1990-10-03
 18 | Frankfurt | 248.31 | f          |          1 |  1 | Germany |   83190556 | 1990-10-03
(4 rows)
```

### Task 5

Show the country of the city with the smallest area in the database.

The output should show one single result. It should show the name of the country, the name of the city and the area of that city.

**Your result should look like this:**

```
  name   |   name    | area
---------+-----------+------
 Uruguay | Maldonado |  4.8
(1 row)
```

### Task 6

Show the country of the capital with the smallest area in the database.

The output should show one single result. It should show the name of the country, the name of the city and the area of that city.

**Your result should look like this:**

```
  name  | name  | area
--------+-------+------
 France | Paris |  105.4
(1 row)
```

### Task 7

Show the capitals of the 3 countries with the highest population.

The output should show the name of the city, the name of the country and the population of that country.

**Your result should look like this:**

```
    name    |    name    | population
------------+------------+------------
 Berlin     | Germany    |   83190556
 Paris      | France     |   67413000
 Nur-Sultan | Kazakhstan |   18711560
(3 rows)
```

### Task 8

Finally, delete Germany from the `country` table and then list all the cities with all the fields.

**Your result should look like this:**

```
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
(18 rows)
```

**Briefly explain what happened.**

### Task 9

Now, add a new column named `code` to the `country` table. This column will hold the [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) country code.

Even though the primary key will still be the column `id`, the `code` should have distinct values in all the rows. The database should not allow two rows with the same `code`.

Then, execute the contents of the file `country.sql` and show the name and code of each country in the table.

**Your result should look like this.**

```
    name     | code
-------------+------
 Germany     | DE
 France      | FR
 Namibia     | NA
 Uruguay     | UY
 Kazakhstan  | KZ
 Spain       | ES
 Switzerland | CH
 Austria     | AT
(8 rows)
```

Then, execute the contents of the file `country_test.sql`.

**Your result should look like this.**

```
ERROR:  duplicate key value violates unique constraint "country_code_key"
DETAIL:  Key (code)=(DE) already exists.
```

### Task 10

Next, create a table named `language` that will have the following columns:

- **code**: A string with an [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code.
- **name**: A string with the official name of the language.

The primary key will be the `code` column.

Then, execute the contents of the file `language.sql` and show the name and code of each language in the table.

**Your result should look like this.**

```
   name    | code
-----------+------
 German    | de
 French    | fr
 Afrikaans | af
 Spanish   | es
 Kazakh    | kk
 Russian   | ru
 Italian   | it
 Catalan   | ca
(8 rows)
```

Then, execute the contents of the file `language_test.sql`.

**Your result should look like this.**

```
ERROR:  duplicate key value violates unique constraint "language_pkey"
DETAIL:  Key (code)=(de) already exists.
```

### Task 11

Now, create a table named `locale`. In computer science, a locale is a set of parameters that defines a user's language and other regional preferences, such as number and date/time formatting.

Each locale is identified using a combination of the language code and the country code (ex: en_US, en_GB, es_ES, ca_ES,...).

Therefore, this table should have the following fields:

- **name**. A string briefly describing the locale (ex: "American English").
- **language_code**. A string with an [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code.
- **country_code**. A string with an [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) country code.

Both ISO codes are always two characters long.

Create this table so that no two rows can have the same combination `language_code + country_code`.

Then, execute the contents of the file `locale.sql` and show all columns and rows in the table.

**Your result should look like this.**

```
        name       | language_code | country_code
-------------------+---------------+--------------
 German            | de            | DE
 Austrian          | de            | AT
 Swiss german      | de            | CH
 French            | fr            | FR
 Afrikaans         | af            | NA
 English (Namibia) | en            | NA
 LATAM Spanish     | es            | UY
 Spanish           | es            | ES
 Kazakh            | kk            | KZ
 Russian           | ru            | KZ
 Italian           | it            | CH
 French            | fr            | CH
 Catalan           | ca            | ES
(13 rows)
```

Then, execute the contents of the file `locale_test.sql`.

**Your result should look like this.**

```
ERROR:  duplicate key value violates unique constraint "locale_pkey"
DETAIL:  Key (language_code, country_code)=(de, DE) already exists.
```

### Task 12

Finally, show a list with the name of each locale as `Locale`, the name of its country as `Country` and the name of its language as `Language`.

Sort the list alphabetically by language name.

**Your result should look like this.**

```
      Locale       | Language  |   Country   
-------------------+-----------+-------------
 Afrikaans         | Afrikaans | Namibia
 Catalan           | Catalan   | Spain
 English (Namibia) | English   | Namibia
 French            | French    | Switzerland
 French            | French    | France
 German            | German    | Germany
 Austrian          | German    | Austria
 Swiss german      | German    | Switzerland
 Italian           | Italian   | Switzerland
 Kazakh            | Kazakh    | Kazakhstan
 Russian           | Russian   | Kazakhstan
 Spanish           | Spanish   | Spain
 LATAM Spanish     | Spanish   | Uruguay
(13 rows)
```
