-- Session 1
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
SELECT sum(rating) FROM pizzeria;

-- Session 2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT sum(rating) FROM pizzeria;
COMMIT;
SELECT sum(rating) FROM pizzeria;

-- Session 2
SELECT sum(rating) FROM pizzeria;
