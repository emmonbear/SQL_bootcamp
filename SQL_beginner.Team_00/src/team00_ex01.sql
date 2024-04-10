SELECT f.total_cost + (SELECT p.price 
                         FROM paths AS p
                        WHERE p.point_1 = f.last_point
                              AND p.point_2 = 'a'
                      ) AS total_cost,
       tour || 'a' || '}' AS tour
  FROM final_tsp AS f
 ORDER BY 1, 2;

DROP VIEW final_tsp