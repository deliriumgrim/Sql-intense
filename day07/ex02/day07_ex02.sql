(SELECT pz.name,
        count(pv.pizzeria_id) AS count,
        'visit'               AS action_type
 FROM pizzeria pz
          JOIN person_visits pv on pz.id = pv.pizzeria_id
 GROUP BY pz.name
 ORDER BY count DESC
 LIMIT 3)
UNION
(SELECT pz.name,
        count(po.menu_id) AS count,
        'order'           AS action_type
 FROM pizzeria pz
          JOIN menu m on pz.id = m.pizzeria_id
          JOIN person_order po on m.id = po.menu_id
 GROUP BY pz.name
 ORDER BY count DESC
 LIMIT 3)
ORDER BY action_type, count DESC;