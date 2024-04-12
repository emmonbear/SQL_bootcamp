  WITH tmp AS 
       (SELECT po.person_id,
               m.pizzeria_id 
          FROM person_order AS po
               JOIN menu AS m
               ON m.id = po.menu_id
       )
INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () AS id,
       t.person_id,
       t.pizzeria_id,
       (CASE 
             WHEN COUNT(*) = 1 THEN 10.5
             WHEN COUNT(*) = 2 THEN 22.0
             ELSE 30.0
         END
       ) AS discount
  FROM tmp AS t
 GROUP BY t.person_id,
          t.pizzeria_id
 ORDER BY 2;