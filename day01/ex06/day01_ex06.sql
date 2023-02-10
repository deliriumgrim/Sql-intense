SELECT order_date AS action_date,
       p1.name    AS person_name
FROM person_order
         JOIN person p1 on p1.id = person_order.person_id
INTERSECT
SELECT visit_date AS action_date,
       p2.name    AS person_name
FROM person_visits
         JOIN person p2 ON p2.id = person_visits.person_id
ORDER BY action_date, person_name DESC;
