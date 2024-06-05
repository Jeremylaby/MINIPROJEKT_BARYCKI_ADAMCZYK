create
    definer = root@`%` procedure ShowPaymentHistory(IN clientID int)
BEGIN
    SELECT
        p.payment_id,
        p.reservation_id,
        p.amount,
        p.date,
        r.client_id,
        r.price AS reservation_cost,
        CASE
            WHEN r.status = 0 THEN -1 * IFNULL((SELECT SUM(amount) FROM Payments WHERE reservation_id = p.reservation_id), 0)
            ELSE IFNULL((SELECT SUM(amount) FROM Payments WHERE reservation_id = p.reservation_id), 0)
        END AS balance,
        r.date_from,
        r.date_to,
        r.status
    FROM
        Payments p
    JOIN
        Reservations r ON p.reservation_id = r.reservation_id
    WHERE
        r.client_id = clientID;
END;

grant execute on procedure ShowPaymentHistory to client;

