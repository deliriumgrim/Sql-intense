CREATE OR REPLACE FUNCTION fnc_fibonacci(IN pstop INTEGER DEFAULT 10)
    RETURNS TABLE
            (
                fnc_fibonacci INTEGER
            )
    LANGUAGE SQL
AS
$$
WITH RECURSIVE t AS (SELECT 0 AS a, 1 AS b
                     UNION ALL
                     SELECT b,
                            a + b
                     FROM t
                     WHERE b < pstop)
SELECT a
FROM t;
$$;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();