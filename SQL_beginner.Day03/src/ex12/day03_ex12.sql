INSERT INTO
      person_order (id, person_id, menu_id, order_date)
SELECT
      (GENERATE_SERIES(
                  (SELECT (MAX(po.id) + 1) FROM person_order AS po),
                  (SELECT (MAX(p.id)) FROM person AS p) + (SELECT (MAX(po.id)) FROM person_order AS po))),
      (GENERATE_SERIES(
            (SELECT min(p.id) FROM person AS p),
            (SELECT max(p.id) FROM person AS p))),
      (SELECT m.id FROM menu AS m WHERE m.pizza_name = 'greek pizza'),
      '2022-02-25';
      