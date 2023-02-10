SELECT name
FROM pizzeria
         LEFT JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
WHERE pizzeria_id IS NULL;
-- left JOIN говорит о том что все записи в таблице слева должны быть в результирующей выборке