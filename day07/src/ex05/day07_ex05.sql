SELECT DISTINCT p.name
FROM person p
JOIN person_order po on p.id = po.person_id
ORDER BY p.name;