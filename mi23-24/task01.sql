SELECT
    deviceTypeName,
    tAgeRestriction,
    'total views: ' || COUNT(*)  as numberOfViews,
    AVG(viewEndDateTime-viewStartDateTime) as avgWatchingTime
FROM
    trackview
    NATURAL JOIN track
    NATURAL JOIN device
    NATURAL JOIN deviceType
WHERE
    (
        EXTRACT(HOUR FROM viewStartDateTime) BETWEEN 0 AND 4
        AND EXTRACT(HOUR FROM viewEndDateTime) BETWEEN 0 AND 4
    )
    AND tAgeRestriction > 10
GROUP BY
    deviceTypeName,
    tAgeRestriction;
