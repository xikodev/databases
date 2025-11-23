SELECT
    owner.ownerId,
    COUNT(profileName) AS profileCount,
    streamNo,
    CASE
        WHEN streamNo IS NOT NULL THEN 'Active packet'
        ELSE 'No active packages'
    END AS status
FROM
    owner
    JOIN profile
        ON owner.ownerId = profile.ownerId
    LEFT JOIN ownerPack
        ON owner.ownerId = ownerPack.ownerId
        AND packEndDate IS NULL
    LEFT JOIN packParam
        ON ownerPack.packId = packParam.packId
        AND packParamDateTo IS NULL
WHERE
    dateOfBirth < '01.01.1975'
GROUP BY
    owner.ownerId,
    streamNo
ORDER BY
    status,
    owner.ownerId DESC;
