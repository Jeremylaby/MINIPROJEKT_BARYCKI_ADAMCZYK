create
    definer = root@`%` procedure CheckReservationOwner(IN in_clientId int, IN in_reservationId int)
BEGIN
    DECLARE actualClientId INT;
    SELECT client_id INTO actualClientId FROM Reservations WHERE reservation_id = in_reservationId;
    IF actualClientId != in_clientId THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'This reservation does not belong to the specified client.';
    END IF;

    SELECT 'Reservation ownership verified successfully.' AS message;
END;

