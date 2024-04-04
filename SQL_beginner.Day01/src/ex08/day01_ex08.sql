SELECT
    order_date,
    p.name || ' (age:' || p.age || ')' AS person_information
FROM (
        SELECT po.person_id AS id, po.order_date
        FROM person_order AS po
    )
    NATURAL JOIN person AS p
ORDER BY order_date, person_information;