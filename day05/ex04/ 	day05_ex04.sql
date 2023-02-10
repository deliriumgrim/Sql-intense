CREATE UNIQUE INDEX IF NOT EXISTS idx_menu_unique ON menu USING btree (pizzeria_id, pizza_name);
SET enable_seqscan = off;

EXPLAIN ANALYSE
SELECT pizza_name,
       p.name
FROM menu
         JOIN pizzeria p on p.id = menu.pizzeria_id;