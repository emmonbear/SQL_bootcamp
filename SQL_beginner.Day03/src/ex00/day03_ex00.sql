WITH kate AS (
            SELECT
                  pv.pizzeria_id AS pizzeria_id,
                  p2.name        AS pizzeria_name,
                  pv.visit_date  AS visit_date
            FROM
                  person_visits AS pv
                  JOIN person AS p1 ON p1.id = pv.person_id
                        AND p1.name = 'Kate'
                  JOIN pizzeria AS p2 ON p2.id = pv.pizzeria_id)
SELECT
      m.pizza_name    AS pizza_name,
      m.price         AS price,
      k.pizzeria_name AS pizzeria_name,
      k.visit_date    AS visit_date
FROM
      kate AS k
      JOIN menu AS m ON m.pizzeria_id = k.pizzeria_id
WHERE
      m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;
