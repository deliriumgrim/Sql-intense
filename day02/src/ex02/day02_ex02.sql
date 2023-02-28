SELECT CASE
           WHEN p.name IS NULL THEN '-'
           ELSE p.name
           END       AS person_name,
       pv.visit_date AS visit_date,
       CASE
           WHEN pz.name IS NULL THEN '-'
           ELSE pz.name
           END       AS pizzeria_name
FROM person p
         FULL JOIN (SELECT *
                    FROM person_visits
                    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv on p.id = pv.person_id
         FULL JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;
