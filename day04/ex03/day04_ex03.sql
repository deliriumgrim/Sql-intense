SELECT vd.generated_date AS missing_date
FROM person_visits pv
RIGHT JOIN v_generated_dates vd ON vd.generated_date = pv.visit_date
WHERE pv.visit_date IS NULL
ORDER BY missing_date;