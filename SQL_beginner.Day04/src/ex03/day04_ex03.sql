SELECT v.generated_date AS missing_date 
  FROM v_generated_dates AS v
EXCEPT
SELECT pv.visit_date AS missing_date
  FROM person_visits AS pv
 ORDER BY 1;