-- Active: 1711731107020@@127.0.0.1@5432@model
-- Session 1
BEGIN;

-- Session 1
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';

-- Session 1
SELECT * 
  FROM pizzeria;

-- Session 2
SELECT *
  FROM pizzeria

-- Session 1
COMMIT;

-- Session 2
SELECT *
  FROM pizzeria;