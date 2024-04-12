COMMENT ON TABLE person_discounts IS 'Table with personalized customer discounts';
COMMENT ON COLUMN person_discounts.id IS 'Primary key of the table';
COMMENT ON COLUMN person_discounts.person_id IS 'Attribute with the identifier person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Attribute with the identifier pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Attribute with the size of the discount';