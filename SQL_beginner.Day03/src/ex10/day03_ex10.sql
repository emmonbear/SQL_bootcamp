INSERT INTO 
      person_order(id, person_id, menu_id, order_date)
VALUES (
      (SELECT (max(po.id) + 1) FROM person_order AS po),
      (SELECT p.id FROM person                   AS p WHERE p.name = 'Denis'),
      (SELECT m.id FROM menu                     AS m WHERE m.pizza_name = 'sicilian pizza'),
      '2022-02-24'
);
INSERT INTO 
      person_order(id, person_id, menu_id, order_date)
VALUES (
      (SELECT (max(po.id) + 1) FROM person_order AS po),
      (SELECT p.id FROM person                   AS p WHERE p.name = 'Irina'),
      (SELECT m.id FROM menu                     AS m WHERE m.pizza_name = 'sicilian pizza'),
      '2022-02-24'
);