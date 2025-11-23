SELECT
    student.studentid,
    firstName,
    lastName,
    courseName
FROM
    student
        LEFT JOIN enrolledcourse
            ON enrolledcourse.studentid = student.studentid
            AND academicYear = 2024
        LEFT JOIN course
            ON course.courseid = enrolledcourse.courseid
WHERE
    EXTRACT (YEAR FROM dateOfBirth) IN (1996, 1997);
