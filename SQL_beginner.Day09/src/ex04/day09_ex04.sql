-- Active: 1711731107020@@127.0.0.1@5432@model
 CREATE FUNCTION fnc_persons_female()
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
        WHERE p.gender = 'female';
     $$ LANGUAGE SQL;

SELECT *
  FROM fnc_persons_female();

 CREATE FUNCTION fnc_persons_male()
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
        WHERE p.gender = 'male';
     $$ LANGUAGE SQL;

SELECT *
  FROM fnc_persons_male();

