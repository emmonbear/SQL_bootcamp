  WITH tmp AS
       (SELECT p1.name,
               m.pizza_name,
               m.price,
               TRUNC((100 - pd.discount) / 100 * m.price) AS discount_price,
               p2.name AS pizzeria_name  
          FROM person_order AS po
               JOIN person AS p1
               ON p1.id = po.person_id
               JOIN menu AS m
               ON m.id = po.menu_id
               JOIN pizzeria AS p2
               ON p2.id = m.pizzeria_id
               JOIN person_discounts AS pd
               ON pd.person_id = po.person_id
                  AND pd.pizzeria_id = m.pizzeria_id
         ORDER BY 1, 2
       )
SELECT *
  FROM tmp AS t