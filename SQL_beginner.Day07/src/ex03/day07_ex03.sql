-- Active: 1711731107020@@127.0.0.1@5432@model
  WITH visit AS
       (SELECT p.name,
               COUNT(*) AS count
          FROM person_visits AS pv
               JOIN pizzeria AS p
               ON p.id = pv.pizzeria_id
         GROUP BY p.name
       ),
       orders AS
       (SELECT p.name,
               COUNT(*) AS count
          FROM person_order AS po
               JOIN menu AS m
               ON m.id = po.menu_id
               JOIN pizzeria AS p
               ON p.id = m.pizzeria_id
         GROUP BY p.name
       )
SELECT v.name,
       o.count + v.count AS total_count
  FROM visit AS v
       JOIN orders AS o
       ON o.name = v.name
 ORDER BY 2 DESC, 1