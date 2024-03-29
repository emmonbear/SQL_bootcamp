SELECT
      *
  FROM
      person_order AS p
 WHERE
      p.id % 2 = 0
 ORDER BY 
      p.id;
