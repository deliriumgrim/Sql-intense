SELECT name
FROM person p
WHERE gender = 'female'
  AND 'cheese pizza' IN (SELECT m2.pizza_name
                         FROM person_order
                                  JOIN person p2 on p2.id = person_order.person_id
                                  JOIN menu m2 on m2.id = person_order.menu_id
                         WHERE p2.id = p.id)
  AND 'pepperoni pizza' IN (SELECT m2.pizza_name
                            FROM person_order
                                     JOIN person p2 on p2.id = person_order.person_id
                                     JOIN menu m2 on m2.id = person_order.menu_id
                            WHERE p2.id = p.id)
ORDER BY name;
