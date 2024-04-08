-- Active: 1711731107020@@127.0.0.1@5432@model
  WITH o AS
       (SELECT p.gender AS gender,
               pp.name  AS pizzeria_name
          FROM person_order AS po
               JOIN person AS p 
               ON p.id = po.person_id
               JOIN menu AS m 
               ON m.id = po.menu_id
               JOIN pizzeria AS pp 
               ON pp.id = m.pizzeria_id),
       male AS
       (SELECT o.pizzeria_name
          FROM o
         WHERE o.gender = 'male'),
       female AS
       (SELECT o.pizzeria_name
          FROM o
         WHERE o.gender = 'female'),
       male_only AS 
       (SELECT *
          FROM male
        EXCEPT
        SELECT *
          FROM female),
       female_only AS 
       (SELECT *
          FROM female
        EXCEPT
        SELECT *
          FROM male)
SELECT *
  FROM male_only
 UNION
SELECT *
  FROM female_only
 ORDER BY 1;