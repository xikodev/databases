SELECT
    UPPER(c1.courseName) AS courseName1,
    c1.hoursWeekly AS hoursWeekly1,
    UPPER(c2.courseName) AS courseName2,
    c2.hoursWeekly AS hoursWeekly2
FROM
    course AS c1
    JOIN course AS c2
        ON c1.ects = c2.ects
        AND c1.hoursweekly <> c2.hoursweekly;
