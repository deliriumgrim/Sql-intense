INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (generate_series((SELECT max(id) FROM person_order) + 1,
                        (SELECT max(id) FROM person_order) + (SELECT max(id) FROM person), 1)),
       (generate_series((SELECT min(id) FROM person_order), (SELECT max(id) FROM person), 1)),
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25';