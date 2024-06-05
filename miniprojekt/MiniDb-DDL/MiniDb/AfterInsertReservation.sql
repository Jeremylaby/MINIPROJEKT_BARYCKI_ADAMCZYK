create definer = root@`%` trigger AfterInsertReservation
    after insert
    on Reservations
    for each row
BEGIN
    INSERT INTO Payments (reservation_id, amount, date, admin_id)
    VALUES (NEW.reservation_id, NEW.price, NOW(), NULL);
END;

