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