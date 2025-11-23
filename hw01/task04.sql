SELECT
    COUNT(DISTINCT classroomid)
FROM
    coursegroup
    NATURAL JOIN course
WHERE
    coursename = 'Digital logic';
