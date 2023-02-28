SELECT pizza_name,
       pz.name AS pizzeria_name,
       price
FROM menu
         JOIN pizzeria pz on pz.id = menu.pizzeria_id
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY pizza_name, pizzeria_name;