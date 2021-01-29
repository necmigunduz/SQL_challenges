--1  
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget
--2 
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid
--3 
SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC
--4 
Table-B
"Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack
--5 
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351
--6 
link the director column in movies with the primary key in actor
connect the primary keys of movie and actor via the casting table
--7 
Table-B
A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011
