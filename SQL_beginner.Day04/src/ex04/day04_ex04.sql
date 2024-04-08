CREATE VIEW v_symmetric_union AS
  WITH R AS 
       (SELECT pv.person_id
          FROM person_visits AS pv
         WHERE pv.visit_date = '2022-01-02'
       ),
       S AS
       (SELECT pv.person_id
          FROM person_visits AS pv
         WHERE pv.visit_date = '2022-01-06'
       ),
       RS AS
       (SELECT R.person_id
          FROM R
        EXCEPT
        SELECT S.person_id
          FROM S
       ),
       SR AS
       (SELECT S.person_id
          FROM S
        EXCEPT
        SELECT R.person_id
          FROM R
       )
SELECT *
  FROM RS
 UNION
SELECT *
  FROM SR
 ORDER BY 1;