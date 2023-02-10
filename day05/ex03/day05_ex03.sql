CREATE INDEX IF NOT EXISTS idx_person_order_multi ON person_order USING btree (person_id, menu_id, order_date);
SET enable_seqscan = off;
EXPLAIN ANALYSE
SELECT person_id,
       menu_id,
       order_date
FROM person_order
WHERE menu_id = 14
  AND person_id = 8
  AND order_date = '2022-01-07';
  
  
  
  --нужно проверить с этим
  SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;