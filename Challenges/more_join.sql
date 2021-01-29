/*JOIN Tutorial*/
/*1*/
SELECT id, title
 FROM movie
 WHERE yr=1962
 /*2*/
 SELECT yr
FROM movie
WHERE title = 'Citizen Kane'
/*3*/
SELECT id, title, yr
FROM movie 
WHERE title LIKE 'Star Trek%'
ORDER BY yr
/*4*/
SELECT id
FROM actor 
WHERE name = 'Glenn Close'
/*5*/
SELECT id 
FROM movie
WHERE title = 'Casablanca'
/*6*/
SELECT name
FROM actor, casting
WHERE id=actorid AND movieid = 11768
/*7*/
SELECT name
FROM actor, casting 
WHERE id=actorid AND movieid = (SELECT id FROM movie WHERE title = 'Alien')
/*8*/
SELECT title
FROM movie JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'))
/*9*/
SELECT title
FROM movie JOIN casting ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford' AND ord != 1))
/*10*/
SELECT title, name
FROM movie JOIN casting ON (id=movieid)
JOIN actor ON (actor.id = actorid)
WHERE ord=1 AND  yr = 1962
/*11*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
/*12*/
SELECT title, name FROM movie
JOIN casting x ON movie.id = movieid
JOIN actor ON actor.id =actorid
WHERE ord=1 AND movieid IN
(SELECT movieid FROM casting y
JOIN actor ON actor.id=actorid
WHERE name='Julie Andrews')
/*13*/
SELECT name
FROM actor JOIN casting ON (id=actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1)>=15)
GROUP BY name
/*14*/
SELECT title, COUNT(actorid) 
FROM movie 
JOIN casting ON movie.id = movieid 
WHERE yr = 1978
GROUP BY title 
ORDER BY COUNT(actorid) DESC, title
/*15*/
SELECT DISTINCT name
FROM actor JOIN casting ON id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON (actorid=id AND name='Art Garfunkel')) AND name != 'Art Garfunkel'