SELECT DISTINCT
    courseName
FROM
    course
    JOIN enrolledCourse
        ON enrolledCourse.courseid = course.courseid
        AND academicYear = 2022
WHERE
    CHAR_LENGTH(courseName) % 2 = 1;
