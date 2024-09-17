.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students GROUP BY smallest HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b
    WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;


CREATE TABLE sevens AS
  SELECT seven FROM students AS s, numbers AS n 
    WHERE s.number = 7 AND s.time = n.time AND b.'7' = 'True';


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;


CREATE TABLE shopping_list AS
  SELECT name, store FROM products AS p, lowest_prices AS l
    WHERE p.name = l.item 
    GROUP BY category HAVING MIN(MSRP/rating);


CREATE TABLE total_bandwidth AS
  SELECT SUM(s.mbs) FROM stores AS s, shopping_list AS sl WHERE s.store = sl.store;

