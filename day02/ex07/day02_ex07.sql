SELECT p2.name
FROM person_visits pv
         JOIN person p on p.id = pv.person_id
         JOIN pizzeria p2 on p2.id = pv.pizzeria_id
         JOIN menu m on p2.id = m.pizzeria_id
WHERE p.name = 'Dmitriy'
  AND pv.visit_date = '2022-01-08'
  AND m.price < 800;

