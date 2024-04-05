WITH fem AS (
            SELECT
                  p.name,
                  po.menu_id
            FROM
                  person_order AS po
                  JOIN person AS p ON p.id = po.person_id
                        AND p.gender = 'female'),
      pp AS (
            SELECT *
            FROM
                  menu AS m
                  JOIN fem AS f ON f.menu_id = m.id
                        AND m.pizza_name = 'pepperoni pizza'),
      cp AS (
            SELECT *
            FROM
                  menu AS m
                  JOIN fem AS f ON f.menu_id = m.id
                        AND m.pizza_name = 'cheese pizza')
SELECT
      cp.name
FROM
      cp
      JOIN pp ON pp.name = cp.name
ORDER BY 1;