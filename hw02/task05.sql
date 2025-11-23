SELECT DISTINCT
    c.courseName
FROM
    course c
    NATURAL JOIN enrolledcourse en
WHERE
    CHAR_LENGTH(c.courseName) % 2 = 0
    AND en.academicYear = 2023;
