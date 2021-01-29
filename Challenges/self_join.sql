/*SELF-NULL Tutorial*/
/*1*/
SELECT COUNT(name)
FROM stops
/*2*/
SELECT id 
FROM stops 
WHERE name = 'Craiglockhart'
/*3*/
SELECT id, name
FROM stops
JOIN route
ON id = stop
WHERE num = '4' AND company = 'LRT';
/*4*/
SELECT company, num, COUNT(*) AS cnt
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING cnt=2
/*5*/
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149
/*6*/
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'
/*7*/
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company =b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
/*8*/
SELECT DISTINCT a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'
/*9*/
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a 
JOIN route b 
ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart';
/*10*/
SELECT DISTINCT x.num,x.company,name,y.num,y.company
FROM(SELECT a.num,a.company,b.stop
FROM route a
JOIN route b
ON a.num = b.num AND a.company = b.company
AND a.stop != b.stop
WHERE a.stop = (SELECT id from stops WHERE name ='Craiglockhart')) AS x
JOIN (SELECT c.num,c.company,c.stop
FROM route c
JOIN route d 
ON c.num = d.num AND c.company = d.company
AND c.stop != d.stop
WHERE d.stop =(SELECT id FROM stops WHERE name = 'Lochend')) AS y
ON x.stop = y.stop
JOIN stops ON x.stop = stops.id
ORDER BY x.num,stops.name,y.num
