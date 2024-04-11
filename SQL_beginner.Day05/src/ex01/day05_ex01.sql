EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
       p.name       AS pizzeria_name
  FROM menu AS m
       JOIN pizzeria AS p
       ON p.id = m.pizzeria_id

/* Планировщик полагает (и вполне справедливо), что таблица слишком мала для сканирования по
индексу, поэтому он выбирает последовательное сканирование, при котором все строки отбрасы-
ваются условием фильтра. Но если мы принудим его выбрать сканирование по индексу, мы полу-
чим: */
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
       p.name       AS pizzeria_name
  FROM menu AS m
       JOIN pizzeria AS p
       ON p.id = m.pizzeria_id

