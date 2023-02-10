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

-- (SELECT pizzeria.name AS pizzeria_name
--  FROM pizzeria
--           JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
--           JOIN person p on p.id = pv.person_id
--  WHERE p.gender = 'male'
--  EXCEPT ALL
--  SELECT pizzeria.name
--  FROM pizzeria
--           JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
--           JOIN person p on p.id = pv.person_id
--  WHERE p.gender = 'female')
-- UNION ALL
-- (SELECT pizzeria.name AS pizzeria_name
--  FROM pizzeria
--           JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
--           JOIN person p on p.id = pv.person_id
--  WHERE p.gender = 'female'
--  EXCEPT ALL
--  SELECT pizzeria.name
--  FROM pizzeria
--           JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
--           JOIN person p on p.id = pv.person_id
--  WHERE p.gender = 'male')
-- ORDER BY pizzeria_name;