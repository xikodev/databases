SELECT
    courseid,
    courseName,
    academicYear,
    SUM(capacity) AS total_capacity
FROM
    courseGroup
    NATURAL JOIN classroom
    NATURAL JOIN course
WHERE
    ects = 6
GROUP BY
    courseid,
    courseName,
    academicYear
HAVING
    SUM(capacity) > 200;
