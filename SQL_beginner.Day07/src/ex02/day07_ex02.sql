  WITH visit AS
       (SELECT p.name,
               COUNT(*) AS count,
               'visit'::VARCHAR AS action_type
          FROM person_visits AS pv
               JOIN pizzeria AS p
               ON p.id = pv.pizzeria_id
         GROUP BY p.name
         LIMIT 3
       ),
       orders AS
       (SELECT p.name,
               COUNT(*) AS count,
               'order'::VARCHAR AS action_type
          FROM person_order AS po
               JOIN menu AS m
               ON m.id = po.menu_id
               JOIN pizzeria AS p
               ON p.id = m.pizzeria_id
         GROUP BY p.name
         LIMIT 3
       )
SELECT *
  FROM visit AS v
 UNION
SELECT *
  FROM orders AS o
 ORDER BY 3, 2 DESC;