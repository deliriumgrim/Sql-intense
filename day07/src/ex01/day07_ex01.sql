SELECT p.name,
       count(pv.pizzeria_id) AS count_of_visits
FROM person_visits pv
JOIN person p on p.id = pv.person_id
GROUP BY p.name
ORDER BY count_of_visits DESC, p.name
LIMIT 4;