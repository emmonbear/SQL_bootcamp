--Session 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Session 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;


--Session 1
SELECT p.rating FROM pizzeria AS p WHERE p.name = 'Pizza Hut';
--Session 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
--Session 2
COMMIT;

--Session 1
SELECT p.rating FROM pizzeria AS p WHERE p.name = 'Pizza Hut';
--Session 1
COMMIT;
--Session 1
SELECT p.rating FROM pizzeria AS p WHERE p.name = 'Pizza Hut';

--Session 2
SELECT p.rating FROM pizzeria AS p WHERE p.name = 'Pizza Hut';