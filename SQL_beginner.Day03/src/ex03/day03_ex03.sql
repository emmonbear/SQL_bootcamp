  WITH a     AS (SELECT
                   p.gender,
                   pp.name
               FROM
                   person_visits AS pv
                   JOIN person AS p ON p.id = pv.person_id
                   JOIN pizzeria AS pp ON pp.id = pv.pizzeria_id),
      male   AS (SELECT a.name AS pizzeria_name FROM a WHERE a.gender = 'male'),
      female AS (SELECT a.name AS pizzeria_name FROM a WHERE a.gender = 'female') 
(
      SELECT * FROM male
      EXCEPT ALL
      SELECT * FROM female
)
 UNION ALL
(
      SELECT * FROM female
      EXCEPT ALL
      SELECT * FROM male
)
 ORDER BY 1;