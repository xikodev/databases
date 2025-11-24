SELECT
    tracktitle movieTitle,
    oscaryear
        oscarCategoryName,
    ROUND((trackrating), 1) as movieRating,
    boxincome,
    CASE
        WHEN boxincome > 400000000 THEN 'High'
        WHEN boxincome > 100000000 THEN 'Medium'
        WHEN boxincome <= 100000000 THEN 'Low'
        ELSE 'Unknown'
    END incomeCategory
FROM
    movie
    NATURAL JOIN track
    NATURAL JOIN oscarNominee
    NATURAL JOIN oscarCategory
WHERE
    oscarYear BETWEEN 1940 AND 2010
    AND (
        SELECT
            count(*)
        FROM
            oscarnominee
        WHERE
            oscarnominee.trackid = movie.trackid
            AND isWinner ='true'
    ) = (
        SELECT
            count(*)
        FROM
            oscarnominee
        WHERE
            oscarnominee.trackid = movie.trackid
    )
ORDER BY
    oscarYear,
    trackrating DESC,
    oscarCategoryName;
