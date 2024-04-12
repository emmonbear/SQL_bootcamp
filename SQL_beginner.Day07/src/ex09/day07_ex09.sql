  WITH formula AS
       (SELECT p.address,
               ROUND(MAX(p.age)::NUMERIC - (MIN(p.age)::NUMERIC  / MAX(p.age)::NUMERIC), 2)::NUMERIC AS formula,
               ROUND(AVG(p.age), 2) AS average
          FROM person AS p
         GROUP BY p.address
       )
SELECT *,
       f.formula > f.average AS comparison
  FROM formula AS f
 ORDER BY 1;