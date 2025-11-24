SELECT
    t.tracktitle AS Title,
    g1.genrename AS Genre1,
    g2.genrename AS Genre2
FROM
    track t
    JOIN trackgenre tg1
        ON t.trackid = tg1.trackid
    JOIN genre g1
        ON tg1.genreid = g1.genreid
    JOIN trackgenre tg2
        ON t.trackid = tg2.trackid
    JOIN genre g2
        ON tg2.genreid = g2.genreid
WHERE
    tg1.genreid < tg2.genreid
    AND t.trackid IN (
        SELECT
            trackid
        FROM
            trackgenre
        GROUP BY
            trackid
        HAVING
            COUNT(DISTINCT genreid) = 2
    )
    AND
        t.tracktitle LIKE '%Love%';
