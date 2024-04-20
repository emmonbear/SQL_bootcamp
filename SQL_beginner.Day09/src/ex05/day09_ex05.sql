   DROP FUNCTION IF EXISTS 
        fnc_persons_female(),
        fnc_persons_male(),
        fnc_persons;

 CREATE FUNCTION fnc_persons (IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
        id BIGINT,
        name VARCHAR,
        age INTEGER,
        gender VARCHAR,
        address VARCHAR
        ) AS
     $$ 
        SELECT *
          FROM person AS p
         WHERE pgender = p.gender;
     $$ LANGUAGE SQL;

 SELECT *
   FROM fnc_persons(pgender := 'male');

 SELECT *
   FROM fnc_persons();