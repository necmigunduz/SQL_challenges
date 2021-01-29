/*JOIN Tutorial*/
/*1*/
SELECT matchid, player
FROM goal 
WHERE  teamid = 'GER'
/*2*/
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012
/*3*/
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid AND player LIKE ('Mario%'))
/*4*/
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (gtime <= 10 AND teamid = id)
/*5*/
SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id AND coach = 'Fernando Santos')
/*6*/
SELECT player
FROM game JOIN goal ON (stadium = 'National Stadium, Warsaw' AND id = matchid)
/*7*/
SELECT player
FROM game JOIN goal ON (stadium = 'National Stadium, Warsaw' AND id = matchid)
/*8*/
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE ((team1='GER' OR team2='GER') AND teamid!='GER')
/*9*/
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
/*10*/
SELECT stadium, COUNT(player)
FROM game JOIN goal ON matchid=id 
GROUP BY stadium
/*11*/
SELECT matchid,mdate,COUNT(player)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP B
Y matchid, mdate
/*12*/
SELECT matchid,mdate,COUNT(player)
FROM goal JOIN game ON id=matchid
WHERE teamid = 'GER'
GROUP BY matchid,mdate
/*13*/
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2