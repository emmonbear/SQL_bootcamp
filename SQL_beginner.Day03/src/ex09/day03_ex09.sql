INSERT INTO 
      person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
      (SELECT (max(pv.id) + 1) FROM person_visits AS pv),
      (SELECT p.id FROM person AS p WHERE p.name = 'Denis'),
      (SELECT pp.id FROM pizzeria AS pp WHERE pp.name = 'Dominos'),
      '2022-02-24'
);
INSERT INTO 
      person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
      (SELECT (max(pv.id) + 1) FROM person_visits AS pv),
      (SELECT p.id FROM person AS p WHERE p.name = 'Irina'),
      (SELECT pp.id FROM pizzeria AS pp WHERE pp.name = 'Dominos'),
      '2022-02-24'
);