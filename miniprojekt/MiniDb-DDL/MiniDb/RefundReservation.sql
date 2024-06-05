create
    definer = root@`%` procedure RefundReservation(IN adminId int, IN reservationId int, IN amountToRefund decimal(10, 2))
BEGIN
    DECLARE toReturn DECIMAL(10,2);
    SELECT to_return INTO toReturn
    FROM ReservationsToRefund
    WHERE reservation_id = reservationId;
    IF toReturn IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Brak możliwości zwrotu: rezerwacja nie jest anulowana lub została już zwrócona.';
    ELSE




        IF amountToRefund > toReturn THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Próba zwrotu większej kwoty niż pierwotnie zapłacono.';
        ELSE
            INSERT INTO Payments (reservation_id, amount, date, admin_id)
            VALUES (reservationId, -amountToRefund, NOW(), adminId);
        END IF;
    END IF;
END;

