SELECT
      p.id,
      p.name,
      CASE 
          WHEN p.age >= 10 AND p.age <= 20 THEN 'interval #1'
          WHEN p.age > 20 AND p.age <= 24 THEN 'interval #2'
          ELSE 'interval #2'
       END AS interval_info
  FROM
      person AS p;