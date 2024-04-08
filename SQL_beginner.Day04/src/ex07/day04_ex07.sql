INSERT INTO person_visits
VALUES (
       (SELECT MAX(pv.id) + 1
          FROM person_visits AS pv
       ),
       (SELECT p1.id 
          FROM person AS p1
         WHERE p1.name = 'Dmitriy'
       ),
       (SELECT DISTINCT p2.id 
          FROM pizzeria AS p2
               JOIN menu AS m
               ON m.pizzeria_id = p2.id
               JOIN mv_dmitriy_visits_and_eats AS mv
               ON mv.pizzeria_name <> p2.name
         WHERE m.price < 800
         LIMIT 1
       ),
       '2022-01-08'
       );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
