SELECT
    lastname,
    firstname,
    o1.orgunitname
FROM
    teacher
    JOIN orgunit AS o1
        ON o1.orgunitid = teacher.orgunitid
    JOIN orgunit AS o2
        ON o1.superorgunitid = o2.orgunitid
WHERE
    CHAR_LENGTH(o1.orgunitname) < CHAR_LENGTH(o2.orgunitname)
    AND dateemployedto IS NULL
ORDER BY
    o1.orgunitname,
    lastname,
    firstname;
