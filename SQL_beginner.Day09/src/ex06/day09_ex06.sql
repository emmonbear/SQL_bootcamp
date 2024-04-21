 CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
                 (
                 IN pperson VARCHAR DEFAULT 'Dmitriy',
                 IN pprice NUMERIC DEFAULT 500,
                 IN pdate DATE DEFAULT '2022-01-08'
                 )
RETURNS TABLE
        (name VARCHAR)
     AS $$
        BEGIN
              RETURN QUERY
                WITH visits AS 
                     (SELECT p1.name
                        FROM person_visits AS pv
                             JOIN pizzeria AS p1 
                             ON p1.id = pv.pizzeria_id
                             JOIN menu AS m
                             ON m.pizzeria_id = p1.id
                                AND m.price < pprice
                             JOIN person AS p2
                             ON p2.id = pv.person_id 
                                AND p2.name = pperson
                       WHERE pv.visit_date = pdate
                     )
              SELECT DISTINCT v.name
                FROM visits AS v;
        END;
        $$ LANGUAGE PLPGSQL;
SELECT *
  FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
  FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

 DROP FUNCTION fnc_person_visits_and_eats_on_date
