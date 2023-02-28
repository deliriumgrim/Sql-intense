SET enable_seqscan = off;

EXPLAIN ANALYSE
SELECT m.pizza_name,
       p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p on p.id = m.pizzeria_id;