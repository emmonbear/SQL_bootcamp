  WITH currency_rate AS
       (SELECT b.user_id,
               b.money,
               b.currency_id,
               CASE 
                    WHEN (SELECT MAX(c.updated) 
                            FROM currency AS c 
                           WHERE b.currency_id = c.id
                                 AND c.updated <= b.updated
                         ) IS NOT NULL
                    THEN (SELECT MAX(c.updated) 
                            FROM currency AS c 
                           WHERE b.currency_id = c.id
                                 AND c.updated <= b.updated
                         )
                    ELSE (SELECT MIN(c.updated)
                            FROM currency AS c
                           WHERE c.id = b.currency_id
                                 AND c.updated > b.updated
                         )  
                END AS updated
          FROM balance AS b
       )
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       c.rate_to_usd * cr.money AS currency_in_usd
  FROM currency_rate AS cr
       JOIN currency AS c
       ON c.id = cr.currency_id 
          AND c.updated = cr.updated
       LEFT JOIN "user" AS u
       ON u.id = cr.user_id
 ORDER BY 1 DESC, 2, 3;