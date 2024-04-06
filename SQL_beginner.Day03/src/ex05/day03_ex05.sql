WITH visit AS (SELECT pp.name AS pizzeria_name
               FROM person_visits AS pv
                     JOIN person AS p ON p.id = pv.person_id
                           AND p.name = 'Andrey'
                     JOIN pizzeria AS pp ON pp.id = pv.pizzeria_id),
      o AS (SELECT pp.name AS pizzeria_name
            FROM person_order AS po
                  JOIN person AS p ON p.id = po.person_id
                        AND p.name = 'Andrey'
                  JOIN menu AS m ON m.id = po.menu_id
                  JOIN pizzeria AS pp ON pp.id = m.pizzeria_id)
SELECT * FROM visit
EXCEPT
SELECT * FROM o
ORDER BY 1;