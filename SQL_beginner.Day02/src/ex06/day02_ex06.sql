SELECT
      m.pizza_name AS pizza_name,
      p2.name      AS pizzeria_name
FROM
      person_order AS po
      JOIN person AS p1 ON p1.id = po.person_id
            AND (p1.name = 'Denis' OR p1.name = 'Anna')
      JOIN menu AS m ON m.id = po.menu_id
      JOIN pizzeria AS p2 ON p2.id = m.pizzeria_id
ORDER BY 1, 2;