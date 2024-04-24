  WITH p_table AS 
       (SELECT id,
               u.name AS name,
               u.lastname AS lastname
          FROM "user" AS u
       ),
       b_table AS
       (SELECT b.user_id AS id,
               b.type AS type,
               SUM(b.money) AS volume,
               b.currency_id
          FROM balance AS b
         GROUP BY b.user_id, 
               b.type,
               b.currency_id
       ),
       c_table_tmp AS
       (SELECT c1.id,
               c1.name,
               MAX(c1.updated) AS updated
          FROM currency AS c1
         GROUP BY c1.id,
               c1.name
       ),
       c_table AS
       (SELECT c1.id AS currency_id,
               c1.name AS currency_name,
               c2.rate_to_usd AS last_rate_to_usd
          FROM c_table_tmp AS c1
               JOIN currency AS c2 
               ON c2.id = c1.id
                  AND c2.name = c1.name
                  AND c1.updated = c2.updated 
       ),
       full_table AS
       (SELECT *
          FROM p_table
               FULL JOIN b_table USING(id)
               FULL JOIN c_table USING(currency_id)
       )
SELECT COALESCE(ft.name, 'not defined') AS name,
       COALESCE(ft.lastname, 'not defined') AS lastname,
       ft.type,
       ft.volume,
       COALESCE(ft.currency_name, 'not defined') AS currency_name,
       COALESCE(ft.last_rate_to_usd, 1) AS last_rate_to_usd,
       ft.volume * COALESCE(ft.last_rate_to_usd, 1) AS total_volume_in_usd
  FROM full_table AS ft
 ORDER BY 1 DESC, 2