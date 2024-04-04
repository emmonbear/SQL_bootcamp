SELECT * FROM person AS p 
CROSS JOIN pizzeria AS pp
ORDER BY 
      p.id ASC, 
      pp.id ASC