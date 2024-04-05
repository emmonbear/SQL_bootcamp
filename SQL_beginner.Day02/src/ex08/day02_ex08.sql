SELECT DISTINCT
      p1.name
FROM
      person_order AS po
      JOIN person AS p1 ON p1.id = po.person_id
            AND p1.gender = 'male'
            AND (p1.address = 'Moscow' OR p1.address = 'Samara')
      JOIN menu AS m ON m.id = po.menu_id
            AND (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
ORDER BY 1 DESC;
