CREATE FUNCTION fnc_fibonacci(IN number numeric DEFAULT 10)
    RETURNS TABLE (fnc_fibonacci numeric)
    LANGUAGE SQL
AS
$$
WITH RECURSIVE t(a, b) AS (VALUES (0, 1)
                           UNION ALL
                           SELECT b, a + b
                           FROM t
                           WHERE b < number)
    SELECT a
        FROM t;
$$;

select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();