SELECT object_name FROM (
      SELECT p.name AS object_name FROM person AS p ORDER BY p.name ASC
)
UNION ALL
SELECT object_name FROM (
      SELECT m.pizza_name AS object_name FROM menu AS m ORDER BY m.pizza_name ASC
)

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
