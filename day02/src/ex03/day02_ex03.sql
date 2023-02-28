WITH cte_table AS (
    SELECT missing_date::date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS missing_date
)
SELECT cte_table.missing_date
FROM cte_table
LEFT JOIN (SELECT DISTINCT visit_date
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS visits ON cte_table.missing_date = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;
