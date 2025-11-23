SELECT
    t.tracktitle || ' (' || EXTRACT(YEAR FROM t.releasedate) || ')' AS tracktitleandyear,
    duration,
    ROUND(t.trackrating, 1) AS trackrating
FROM
    track t
    JOIN trackview tv
        ON tv.trackid = t.trackid
WHERE
    t.tracktitle LIKE 'The%'
    AND EXTRACT(EPOCH FROM t.duration) > 7200
    AND t.trackrating IS NOT NULL
    AND tv.viewstartdatetime >= (CURRENT_TIMESTAMP - INTERVAL '5 years')
GROUP BY
    t.tracktitle,
    t.releasedate,
    t.duration,
    t.trackrating;
