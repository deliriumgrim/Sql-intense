SELECT m.pizza_name,
       m.price,
       p.name AS pizzeria_name,
       pv.visit_date
FROM menu m
         JOIN pizzeria p ON p.id = m.pizzeria_id
         JOIN person_visits pv ON p.id = pv.pizzeria_id
         JOIN person p2 ON p2.id = pv.person_id
WHERE m.price BETWEEN 800 AND 1000
  AND p2.name = 'Kate'
ORDER BY m.pizza_name, m.price, pizza_name;