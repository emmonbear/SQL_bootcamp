CREATE TABLE paths (
       point_1 VARCHAR(10) NOT NULL,
       point_2 VARCHAR(10) NOT NULL,
       price   INTEGER     NOT NULL
);

INSERT INTO paths (point_1, point_2, price)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);

CREATE VIEW final_tsp AS
  WITH RECURSIVE tsp(tour, total_cost, last_point) AS (
       SELECT '{' || p.point_1 || ','::VARCHAR,
              0,
              p.point_1
         FROM paths AS p
        WHERE p.point_1 = 'a'
        UNION
       SELECT t.tour || p.point_2 || ',',
              t.total_cost + p.price,
              p.point_2
         FROM tsp AS t
              JOIN paths AS p
              ON t.last_point = p.point_1
                 AND (STRPOS(t.tour, p.point_2) = 0)
       )
SELECT t.tour,
       t.total_cost,
       t.last_point
  FROM tsp AS t
 WHERE LENGTH(t.tour) = 9

SELECT *
  FROM (SELECT f.total_cost + (SELECT p.price
                                 FROM paths AS p
                                WHERE p.point_1 = f.last_point
                                      AND p.point_2 = 'a'
                               ) AS total_cost,
               tour || 'a' || '}' AS tour
          FROM final_tsp AS f) AS subquery
 WHERE total_cost = 80;


