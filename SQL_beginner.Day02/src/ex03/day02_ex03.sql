WITH md AS (
      SELECT missing_date::date
      FROM GENERATE_SERIES('2022-01-01'::TIMESTAMP, '2022-01-10', '1 day') AS missing_date
),
pv_filtered AS (
      SELECT *
      FROM person_visits AS pv
      WHERE (person_id = 1 OR person_id = 2) 
            AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
)
SELECT md.missing_date
FROM md
      LEFT JOIN pv_filtered AS pv ON md.missing_date = pv.visit_date
WHERE pv.id IS NULL
ORDER BY 1;