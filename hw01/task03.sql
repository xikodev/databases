SELECT
    t.teacherid,
    t.firstname,
    t.lastname,
    c.studentgroupid
FROM
    teacher t
    LEFT JOIN coursegroup c
        ON t.teacherid = c.teacherid
        AND academicyear = 2022
WHERE
    zipresidence = 32100;
