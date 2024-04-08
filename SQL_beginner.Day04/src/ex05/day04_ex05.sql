CREATE VIEW v_price_with_discount AS
  WITH full_po AS
       (SELECT p.name AS name,
               m.pizza_name AS pizza_name,
               m.price AS price
          FROM person_order AS po
               JOIN person AS p
               ON p.id = po.person_id
               JOIN menu AS m
               ON m.id = po.menu_id
       )
SELECT *,
       CAST((f.price - f.price * 0.1) AS INTEGER) AS discount_price
  FROM full_po AS f
 ORDER BY 1, 2;