  WITH visit AS
       (SELECT p.name,
               COUNT(*) AS count
          FROM person_visits AS pv
               JOIN pizzeria AS p
               ON p.id = pv.pizzeria_id
         GROUP BY p.name
       ),
       orders AS
       (SELECT p.name,
               COUNT(*) AS count
          FROM person_order AS po
               JOIN menu AS m
               ON m.id = po.menu_id
               JOIN pizzeria AS p
               ON p.id = m.pizzeria_id
         GROUP BY p.name
       ),
       svo AS
       (SELECT CASE 
                    WHEN v.name IS NULL THEN o.name  
                    ELSE v.name
               END,
               COALESCE(v.count, 0) AS cnt1,
               COALESCE(o.count, 0) AS cnt2
          FROM visit AS v
               FULL JOIN orders AS o
               ON o.name = v.name
       )
SELECT svo.name,
       svo.cnt1 + svo.cnt2 AS total_count
  FROM svo
 ORDER BY 2 DESC, 1;
