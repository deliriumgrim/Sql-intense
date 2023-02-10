SELECT m.pizza_name,
       p2.name AS pizzeria_name
FROM person_order
         JOIN person p on p.id = person_order.person_id
         JOIN menu m on m.id = person_order.menu_id
         JOIN pizzeria p2 on p2.id = m.pizzeria_id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;