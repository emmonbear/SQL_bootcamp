SELECT
      (SELECT
             p.name
         FROM
             person AS p
        WHERE
             p.id = pv.person_id) AS person_name,
      (SELECT
             pp.name
         FROM
             pizzeria AS pp
        WHERE
             pp.id = pv.pizzeria_id) AS pizzeria_name
  FROM (
      SELECT 
            pv.person_id,
            pv.pizzeria_id
        FROM
            person_visits AS pv
       WHERE
            visit_date BETWEEN '2022-01-07' 
            AND '2022-01-09'
  ) AS pv
 ORDER BY 
      person_name ASC,
      pizzeria_name DESC;
      