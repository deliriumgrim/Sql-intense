SELECT p_order.order_date,
       p_person.name || ' (age:' || p_person.age || ')' AS person_information
FROM (SELECT order_date,
             person_id AS id
      FROM person_order) p_order
         NATURAL JOIN person p_person
ORDER BY order_date, person_information;