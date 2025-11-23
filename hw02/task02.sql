SELECT
    orgunitname,
    (
        SELECT
            AVG(coeff)
        FROM
            teacher
        WHERE
            teacher.orgunitid = orgunit.orgunitid
    ) AS average_coeff
FROM
    orgunit
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            teacher
        WHERE
            teacher.orgunitid = orgunit.orgunitid
    ) > 4;
