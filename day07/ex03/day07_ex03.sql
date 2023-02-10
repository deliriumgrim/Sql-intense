SELECT f.name,
       count(count) AS total_count
FROM ((SELECT pz.name,
        pv.person_id AS count
 FROM pizzeria pz
          JOIN person_visits pv on pz.id = pv.pizzeria_id)
UNION ALL
(SELECT pz.name,
        po.person_id AS count
 FROM pizzeria pz
          JOIN menu m on pz.id = m.pizzeria_id
          JOIN person_order po on m.id = po.menu_id)) f
GROUP BY f.name
ORDER BY total_count DESC, f.name;