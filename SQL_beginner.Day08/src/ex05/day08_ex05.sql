--Session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;


--Session 1
SELECT SUM(p.rating) FROM pizzeria AS p;
--Session 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
--Session 2
COMMIT;

--Session 1
SELECT SUM(p.rating) FROM pizzeria AS p;
--Session 1
COMMIT;

--Session 1
SELECT SUM(p.rating) FROM pizzeria AS p;
--Session 2
SELECT SUM(p.rating) FROM pizzeria AS p;