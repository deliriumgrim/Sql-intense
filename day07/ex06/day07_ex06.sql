SELECT pz.name,
       count(po.person_id) AS count_of_orders,
       round(avg(m.price), 2) AS average_price,
       max(m.price) AS max_price,
       min(m.price) AS min_price
FROM pizzeria pz
JOIN menu m on pz.id = m.pizzeria_id
JOIN person_order po on m.id = po.menu_id
GROUP BY pz.name
ORDER BY pz.name;