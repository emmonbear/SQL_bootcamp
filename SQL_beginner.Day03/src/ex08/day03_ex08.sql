INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
       (SELECT (MAX(m.id) + 1) 
          FROM menu AS m),
       (SELECT p.id 
          FROM pizzeria AS p 
         WHERE p.name = 'Dominos'),
       'sicilian pizza',
       900
       );
