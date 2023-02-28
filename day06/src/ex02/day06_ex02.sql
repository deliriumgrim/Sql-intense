SELECT p.name,
       m.pizza_name,
       m.price,
       (1 - pd.discount / 100) * (m.price) AS discount_price,
       p2.name AS pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria p2 ON p2.id = m.pizzeria_id
JOIN person_discounts pd ON po.person_id = pd.person_id AND p2.id = pd.pizzeria_id
ORDER BY p.name, m.pizza_name;