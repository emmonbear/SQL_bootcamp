WITH a AS (SELECT
                  m.id         AS id,
                  m.pizza_name AS pizza_name,
                  m.price      AS price,
                  p.name       AS pizzeria_name
            FROM
                  menu AS m
                  JOIN pizzeria AS p ON p.id = m.pizzeria_id),
      pr AS (SELECT
                  a1.pizza_name    AS pizza_name,
                  a1.pizzeria_name AS pizzeria_name1,
                  a2.pizzeria_name AS pizzeria_name2,
                  a1.price         AS price
            FROM
                  a AS a1
                  JOIN a AS a2 ON a1.price = a2.price
                  AND a1.id > a2.id
                  AND a1.pizza_name = a2.pizza_name)
SELECT * FROM pr
ORDER BY 1;