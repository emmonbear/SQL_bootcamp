--Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session 1
SELECT SUM(p.rating) FROM pizzeria AS p;
--Session 2
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
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