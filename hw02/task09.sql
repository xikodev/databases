SELECT DISTINCT
    e.studentid,
    firstName,
    lastName,
    e.courseid
FROM
    exam AS e
    NATURAL JOIN student
WHERE
    EXTRACT(YEAR FROM e.gradeDate + '3 month'::INTERVAL) -1 = 2022
    AND e.grade = 1
    AND EXISTS (
        SELECT
           1
        FROM
            exam AS e2
        WHERE
            e2.studentid = e.studentid
            AND e2.courseid <> e.courseid
            AND e2.grade = 1
            AND EXTRACT(YEAR FROM e2.gradeDate + '3 month'::INTERVAL) -1 = 2022
    )
    AND (
        SELECT
            AVG(e3.grade)
        FROM
            exam AS e3
        WHERE
            e3.studentid = e.studentid
            AND e3.grade > 1
    ) > 3.1;
