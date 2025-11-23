UPDATE
    courseGroup
SET
    teacherId = (
        SELECT
            teacherId
        FROM teacher
        WHERE
            firstName = 'Klementina'
          AND lastName = 'Lapaine'
    )
WHERE
    teacherId = (
        SELECT
            teacherId
        FROM
            teacher
        WHERE
            firstName = 'Mirko'
          AND lastName = 'Kasun'
    );
