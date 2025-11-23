SELECT
    cr.classroomId,
    cr.capacity,
    COUNT(DISTINCT cg.courseId) AS numOfCourses
FROM
    classroom AS cr
    LEFT JOIN courseGroup AS cg
        ON cg.classroomId = cr.classroomId
        AND cg.academicYear = 2024
WHERE
    cr.classroomId LIKE 'D%'
    AND cr.capacity < (
        SELECT
            MAX(capacity)
        FROM
            classroom
        WHERE
            classroomId LIKE 'A%'
    )/2
GROUP BY
    cr.classroomId
ORDER BY
    numOfCourses DESC,
    cr.classroomId ASC;
