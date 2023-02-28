WITH etc_table AS (SELECT pizzeria.name AS pizzeria_name,
                          p.gender
                   FROM pizzeria
                            JOIN menu m ON pizzeria.id = m.pizzeria_id
                            JOIN person_order po ON m.id = po.menu_id
                            JOIN person p ON p.id = po.person_id)
(SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'male'
 EXCEPT
 SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'female')
UNION
(SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'female'
 EXCEPT
 SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'male')
ORDER BY pizzeria_name;