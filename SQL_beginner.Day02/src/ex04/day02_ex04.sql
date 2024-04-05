SELECT
      m.pizza_name,
      p.name       AS pizzeria_name,
      m.price      AS price
FROM
      menu AS m
      LEFT JOIN pizzeria AS p ON p.id = m.pizzeria_id
            AND (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
WHERE
      p.name IS NOT NULL
ORDER BY 1, 2;