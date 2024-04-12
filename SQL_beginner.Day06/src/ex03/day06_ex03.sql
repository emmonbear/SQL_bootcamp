CREATE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT *
  FROM person_discounts AS pd
 WHERE pd.person_id = 1
       AND pd.pizzeria_id = 1