  WITH a AS 
       (SELECT m.id AS menu_id
          FROM menu AS m
        EXCEPT
        SELECT po.menu_id
          FROM person_order AS po
       )
SELECT m.pizza_name AS pizza_name,
       m.price      AS price,
       p.name       AS pizzeria_name
  FROM a
       JOIN menu AS m 
       ON m.id = a.menu_id
       JOIN pizzeria AS p 
       ON p.id = m.pizzeria_id
ORDER BY 1, 2;