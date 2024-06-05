create
    definer = root@`%` procedure MonthlyFinancialReport(IN reportYear int, IN reportMonth int)
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ReservationsToRefund r
        WHERE YEAR(r.date_to) = reportYear AND MONTH(r.date_to) = reportMonth
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot generate report: pending refunds exist for this month.';
    ELSE
        SELECT
            r.reservation_id,
            r.client_id,
            r.date_from,
            r.date_to,
            r.status,
            r.price,
            COALESCE((SELECT SUM(p.amount) FROM Payments p WHERE p.reservation_id = r.reservation_id), 0) AS balance
        FROM
            Reservations r
        WHERE
            YEAR(r.date_to) = reportYear AND
            MONTH(r.date_to) = reportMonth;
    END IF;
END;

