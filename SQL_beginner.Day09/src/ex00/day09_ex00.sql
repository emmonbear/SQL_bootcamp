CREATE TABLE person_audit (
       created    TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
       type_event CHAR(1)     NOT NULL DEFAULT 'I',
       row_id     BIGINT      NOT NULL,
       name       VARCHAR,
       age        INTEGER,
       gender     VARCHAR,
       address    VARCHAR,
       CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);