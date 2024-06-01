create
    definer = root@`%` procedure GetRoomsToClean(IN target_date date)
BEGIN
    SELECT
        f.flat_number,
        r.date_to,
        r.reservation_id
    FROM
        Flats f
    JOIN
        Reservations r ON f.flat_id = r.flat_id
    WHERE

        r.date_to = target_date
        AND r.status = 1; 
END;

