SELECT
      (SELECT
             p2.name
         FROM
             person AS p2
        WHERE
            p2.id = p1.person_id),
      (SELECT
             p2.name
         FROM
             person AS p2
        WHERE
            p2.id = p1.person_id) = 'Denis' AS check_name
  FROM
      person_order AS p1
 WHERE
      (p1.menu_id = 13
      OR p1.menu_id = 14
      OR p1.menu_id = 18)
      AND p1.order_date = '2022-01-07';