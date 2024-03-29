/* Return the identifiers of people (no duplicates) who visited 
 pizzerias between January 6, 2022 and January 9, 2022 
 (including all days) or visited pizzerias with identifier 2. 
 Also include an ordering condition by person ID in descending mode 
 */
SELECT DISTINCT p.person_id
  FROM
      person_visits AS p
 WHERE
      p.visit_date BETWEEN '2022-01-06'
      AND '2022-01-09'
      OR p.pizzeria_id = '2'
 ORDER BY
      p.person_id DESC;