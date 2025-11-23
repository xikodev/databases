SELECT
    s.studentId,
    s.firstName,
    s.lastName,
    e.courseId,
    e.grade
FROM
    exam e
    NATURAL JOIN student s
WHERE
    e.grade > 1
    AND EXTRACT(YEAR FROM e.gradeDate + '3 months'::INTERVAL) - 1 = 2024
    AND (
        SELECT
            AVG(grade)
        FROM
            exam
        WHERE
            studentId = s.studentId
            AND grade > 1
    ) > 3.5
    AND NOT EXISTS (
        SELECT
            1
        FROM
            exam
        WHERE
            courseId = e.courseId
            AND grade = e.grade
            AND grade > 1
            AND EXTRACT(YEAR FROM gradeDate + '3 months'::INTERVAL) - 1 = 2024
            AND studentId <> e.studentId
    );
