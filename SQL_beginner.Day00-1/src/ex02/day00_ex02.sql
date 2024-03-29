/* Returns the list of pizzerias (pizzeria name and rating) 
 with rating from 3.5 to 5 points pizzeria rating with select 
 operator contains comparison signs (<=, >=);
 */
SELECT
      p.name,
      p.rating
  FROM
      pizzeria AS p
 WHERE
      p.rating >= 3.5
      AND p.rating <= 5
 ORDER BY
      p.rating ASC;

/* Returns the list of pizzerias (pizzeria name and rating) 
 with rating from 3.5 to 5 points pizzeria rating with select 
 operator contains BETWEEN keyword;
 */
SELECT
      p.name,
      p.rating
  FROM
      pizzeria AS p
 WHERE
      p.rating BETWEEN 3.5
      AND 5
 ORDER BY
      p.rating ASC;