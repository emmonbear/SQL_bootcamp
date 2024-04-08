CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
WITH visit AS (
            SELECT
                  pizzeria_id,
                  p2.name
            FROM
                  person_visits AS pv
                  JOIN person AS p1 ON p1.id = pv.person_id
                        AND p1.name = 'Dmitriy'
                        AND pv.visit_date = '2022-01-08'
                  JOIN pizzeria AS p2 ON p2.id = pv.pizzeria_id)
SELECT
      v.name AS pizzeria_name
FROM
      menu AS m
      JOIN visit AS v ON v.pizzeria_id = m.pizzeria_id
WHERE
      m.price < 800;