-- Active: 1711731107020@@127.0.0.1@5432@model
SELECT
      p.id AS object_id,
      p.name AS object_name
FROM person AS p
UNION ALL
SELECT
      m.id AS object_id,
      m.pizza_name AS object_name
FROM menu AS m
ORDER BY 
      1 ASC,
      2 ASC 
