CREATE INDEX idx_person_order_multi ON person_order(person_id, menu_id, order_date);
EXPLAIN ANALYSE
SELECT po.person_id, 
       po.menu_id,
       po.order_date
  FROM person_order AS po
 WHERE person_id = 8 
       AND menu_id = 19;

SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYSE
SELECT po.person_id, 
       po.menu_id,
       po.order_date
  FROM person_order AS po
 WHERE person_id = 8 
       AND menu_id = 19;
