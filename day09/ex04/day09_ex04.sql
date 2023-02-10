CREATE OR REPLACE FUNCTION fnc_persons_female()
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
    LANGUAGE sql
AS
$$
SELECT *
FROM person
WHERE person.gender = 'female';
$$;

CREATE OR REPLACE FUNCTION fnc_persons_male()
    RETURNS TABLE
            (
                id      bigint,
                name    varchar,
                age     integer,
                gender  varchar,
                address varchar
            )
    LANGUAGE sql
AS
$$
SELECT *
FROM person
WHERE person.gender = 'male';
$$;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();