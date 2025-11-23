SELECT
    owner.ownerId,
    firstName,
    lastName, COUNT(*) AS paidMonths,
    (
        SELECT
            SUM(freemonths)
        FROM
            ownerPack
            WHERE
                ownerId = owner.ownerId
            AND freeMonths IS NOT NULL
    ) AS freeMonths
FROM
    payment
    NATURAL JOIN owner
WHERE
    (
        SELECT
            SUM(ownerPack.freemonths)
        FROM
            ownerPack
        WHERE
            ownerId = owner.ownerId
            AND freeMonths IS NOT NULL
    ) > 20
GROUP BY
    owner.ownerId;
