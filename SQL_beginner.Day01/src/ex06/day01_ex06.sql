SELECT
    action_date,
    name        AS person_name
FROM
    (
        SELECT
            po.order_date AS action_date,
            po.person_id  AS person_id
        FROM
            person_order AS po
        INTERSECT ALL
        SELECT
            pv.visit_date AS action_date,
            pv.person_id  AS person_id
        FROM
            person_visits AS pv
        ORDER BY
            action_date ASC,
            person_id DESC
    ) AS p
    JOIN person AS pp ON p.person_id = pp.id
ORDER BY
    action_date,
    person_name DESC
;