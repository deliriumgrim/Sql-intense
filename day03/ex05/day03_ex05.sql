SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
         JOIN person_visits pv ON pz.id = pv.pizzeria_id
         JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
         JOIN menu m ON pz.id = m.pizzeria_id
         JOIN person_order po ON m.id = po.menu_id
         JOIN person p2 ON p2.id = po.person_id
WHERE p2.name = 'Andrey'
ORDER BY pizzeria_name;
