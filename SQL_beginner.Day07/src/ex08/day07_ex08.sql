SELECT p1.address,
       p2.name,
       COUNT(*) AS count_of_orders
  FROM person_order AS po
       JOIN menu AS m
       ON m.id = po.menu_id
       JOIN person AS p1
       ON p1.id = po.person_id
       JOIN pizzeria AS p2
       ON p2.id = m.pizzeria_id
 GROUP BY p2.name, p1.address
 ORDER BY 1, 2