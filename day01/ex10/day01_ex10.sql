SELECT person.name  AS person_name,
       m.pizza_name AS pizza_name,
       p.name       AS pizzeria_name
FROM person
         JOIN person_order po ON person.id = po.person_id
         JOIN menu m ON m.id = po.menu_id
         JOIN pizzeria p ON m.pizzeria_id = p.id
ORDER BY person_name, pizza_name, pizzeria_name;