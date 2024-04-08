SELECT m.name
  FROM v_persons_male AS m
 UNION 
SELECT f.name
  FROM v_persons_female AS f
 ORDER BY 1;