CREATE TABLE IF NOT EXISTS person_discounts (
      id BIGINT PRIMARY KEY,
      person_id BIGINT NOT NULL CONSTRAINT fk_person_discounts_person_id REFERENCES person,
      pizzeria_id BIGINT NOT NULL CONSTRAINT fk_person_discounts_pizzeria_id REFERENCES pizzeria,
      discount NUMERIC NOT NULL
);