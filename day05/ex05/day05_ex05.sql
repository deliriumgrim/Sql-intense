CREATE UNIQUE INDEX IF NOT EXISTS idx_person_order_order_date ON person_order USING btree (person_id, menu_id)
    WHERE order_date = '2022-01-01';
SET enable_seqscan = off;

EXPLAIN ANALYSE
SELECT *
FROM person_order
WHERE order_date = '2022-01-01';