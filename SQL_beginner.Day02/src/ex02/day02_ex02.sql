SELECT
      COALESCE(p1.name, '-') AS person_name,
      pv.visit_date          AS visit_date,
      COALESCE(p2.name, '-') AS pizzeria_name
FROM
      person AS p1
LEFT JOIN person_visits AS pv ON pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03' AND pv.person_id = p1.id 
FULL JOIN pizzeria AS p2 ON pv.pizzeria_id = p2.id
ORDER BY 1, 2, 3;