SELECT pz.name,
       pz.rating
FROM pizzeria pz
         LEFT JOIN person_visits pv ON pz.id = pv.pizzeria_id
WHERE pizzeria_id IS NULL;