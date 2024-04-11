CREATE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT m.pizzeria_id,
       m.pizza_name
  FROM menu AS m