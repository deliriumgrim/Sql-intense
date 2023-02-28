SELECT p.name,
       count(*) AS count_of_visits
FROM person p
         JOIN person_visits pv on p.id = pv.person_id
GROUP BY p.name
HAVING count(*) > 3;