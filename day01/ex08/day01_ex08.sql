SELECT p_order.order_date,
       p_person.name || ' (age:' || p_person.age || ')' AS person_information
FROM (SELECT order_date,
             person_id AS id
      FROM person_order) p_order
         NATURAL JOIN person p_person
ORDER BY order_date, person_information;

--натрульный джоин связывает по названию столбцов, в отличие от явного джоина
-- фишка состоит в том что бы натуральный джоин связывал с необходимым столбцом
-- нам необходимо нужный столбец(person_id в табл person_order) переименовать в id(так же как и в таблице person)
--