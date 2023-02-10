SELECT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id
                 FROM person_visits);
--предикат in ведет поиск из диапазона значений
--и если значения есть то выбираются все строки с такими значениями
SELECT name
FROM pizzeria
WHERE NOT EXISTS(SELECT pizzeria_id
                 FROM person_visits
                 WHERE pizzeria.id = person_visits.pizzeria_id);
--exist возвращает булево значение