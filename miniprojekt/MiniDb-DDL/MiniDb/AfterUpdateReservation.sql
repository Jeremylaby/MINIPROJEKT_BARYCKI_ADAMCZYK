create definer = root@`%` trigger AfterUpdateReservation
    after update
    on Reservations
    for each row
BEGIN
    IF NEW.price > OLD.price THEN
        INSERT INTO Payments (reservation_id, amount, date, admin_id)
        VALUES (NEW.reservation_id, NEW.price - OLD.price, NOW(), NULL);
    END IF;
END;

