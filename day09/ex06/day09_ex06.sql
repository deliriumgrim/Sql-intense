CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson varchar DEFAULT 'Anna', IN pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08')
    RETURNS TABLE
            (
                pizzeria_name varchar
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY (SELECT pz.name
                  FROM pizzeria pz
                           JOIN menu m on pz.id = m.pizzeria_id
                           JOIN person_visits pv on pz.id = pv.pizzeria_id
                           JOIN person_order po on m.id = po.menu_id AND po.order_date = pv.visit_date
                           JOIN person p on p.id = pv.person_id AND p.id = po.person_id
                  WHERE p.name = pperson
                    AND m.price < pprice
                    AND po.order_date = pdate);
END
$$;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');