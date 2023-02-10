CREATE VIEW v_symmetric_union
AS (
(SELECT pv.person_id
 FROM person_visits pv
 WHERE visit_date = '2022-01-02'
 EXCEPT
 SELECT pv.person_id
 FROM person_visits pv
 WHERE visit_date = '2022-01-06')
UNION
(SELECT pv.person_id
 FROM person_visits pv
 WHERE visit_date = '2022-01-06'
 EXCEPT
 SELECT pv.person_id
 FROM person_visits pv
 WHERE visit_date = '2022-01-02')
   ) ORDER BY person_id;
