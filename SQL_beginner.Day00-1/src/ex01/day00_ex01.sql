SELECT
      p.name,
      p.age
  FROM
      person as p
 WHERE
      p.address = 'Kazan'
      AND p.gender = 'female'
ORDER BY
      p.name;