SELECT
    p.name       AS person_name,
    m.pizza_name AS pizza_name,
    pp.name      AS pizzeria_name
FROM
    person_order AS po
    JOIN person AS p ON p.id = po.person_id
    JOIN menu AS m ON m.id = po.menu_id
    JOIN pizzeria AS pp ON pp.id = m.pizzeria_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name
;