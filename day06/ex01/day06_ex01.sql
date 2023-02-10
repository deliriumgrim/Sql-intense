INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT row_number() over () AS id,
       p.person_id,
       m.pizzeria_id,
       CASE
           WHEN count(m.pizzeria_id) = 1
               THEN 10.5
           WHEN count(m.pizzeria_id) = 2
               THEN 22
           ELSE 30
           END              AS discount
FROM person_order p
         JOIN menu m on m.id = p.menu_id
GROUP BY (pizzeria_id, person_id);