SELECT DISTINCT p.name
FROM person p
         JOIN person_order po ON p.id = po.person_id
         JOIN menu m ON m.id = po.menu_id
WHERE p.gender = 'male'
  AND m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
  AND p.address IN ('Moscow', 'Samara')
ORDER BY p.name DESC;