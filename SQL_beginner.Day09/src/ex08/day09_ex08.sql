CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
RETURNS TABLE (a INTEGER) AS
        $$
           WITH RECURSIVE f(a, b) AS
                (SELECT 0 AS a, 1 AS b
                UNION ALL
                SELECT b, a + b
                FROM f
                WHERE b < pstop
                )
         SELECT a
           FROM f;
        $$ LANGUAGE SQL;

select * from fnc_fibonacci(20);

select * from fnc_fibonacci();