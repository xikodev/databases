CREATE TABLE studgpa (
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    studentid VARCHAR(10),
    totalects NUMERIC(4, 1)
);

INSERT INTO
    studgpa
SELECT
    firstname,
    lastname,
    studentid,
    SUM(ects) AS totalects
FROM
    exam
    NATURAL JOIN student
    NATURAL JOIN course
WHERE
    grade > 1
GROUP BY
    firstname,
    lastname,
    studentid
HAVING
    SUM(ects) > 80;
