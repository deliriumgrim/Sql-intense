SELECT m1.pizza_name,
       m1.price,
       p.name AS pizzeria_name
FROM menu AS m1
         JOIN (SELECT id AS menu_id
               FROM menu
               EXCEPT
               SELECT menu_id
               FROM person_order po) AS m2 ON m1.id = m2.menu_id
         JOIN pizzeria p on p.id = m1.pizzeria_id
ORDER BY pizza_name, price;
