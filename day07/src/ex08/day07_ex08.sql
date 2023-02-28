SELECT p.address,
       pz.name,
       count(po.order_date) AS count_of_orders
FROM pizzeria pz
         JOIN menu m on pz.id = m.pizzeria_id
         JOIN person_order po on m.id = po.menu_id
         JOIN person p on p.id = po.person_id
GROUP BY pz.name, p.address
ORDER BY p.address, pz.name;