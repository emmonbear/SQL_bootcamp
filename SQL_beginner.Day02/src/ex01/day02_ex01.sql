SELECT
      missing_date::date
FROM
      GENERATE_SERIES('2022-01-01'::TIMESTAMP, '2022-01-10', '1 day') AS missing_date
      LEFT JOIN person_visits AS pv ON missing_date = pv.visit_date
            AND (pv.person_id = 1 OR pv.person_id = 2)
            AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-10'
WHERE
      pv.id IS NULL
ORDER BY 1;