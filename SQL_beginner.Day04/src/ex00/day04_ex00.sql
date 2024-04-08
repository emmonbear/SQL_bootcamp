CREATE VIEW v_persons_female AS
SELECT *
  FROM person AS p
 WHERE p.gender = 'female'

CREATE VIEW v_persons_male AS
SELECT *
  FROM person AS p
 WHERE p.gender = 'male'

SELECT * FROM v_persons_male

DROP VIEW v_persons_female