SELECT
    zipbirth,
    COUNT(*)
FROM
    student
WHERE
    zipbirth IS NOT NULL
GROUP BY
    zipbirth;
