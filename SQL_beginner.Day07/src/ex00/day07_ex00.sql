SELECT pv.person_id,
       COUNT(*) AS count_of_visits
  FROM person_visits AS pv
 GROUP BY pv.person_id
 ORDER BY 2 DESC, 1;