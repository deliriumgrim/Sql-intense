WITH etc_table AS (SELECT pizzeria.name AS pizzeria_name,
                          p.gender
                   FROM pizzeria
                            JOIN person_visits pv ON pizzeria.id = pv.pizzeria_id
                            JOIN person p ON p.id = pv.person_id)
(SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'male'
 EXCEPT ALL
 SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'female')
 UNION ALL
(SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'female'
 EXCEPT ALL
 SELECT etc_table.pizzeria_name
 FROM etc_table
 WHERE etc_table.gender = 'male')
 ORDER BY pizzeria_name;