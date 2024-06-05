create
    definer = root@`%` procedure isRoomAvailable(IN flatId int, IN dateFrom date, IN dateTo date)
BEGIN
    IF EXISTS (
        SELECT 1 FROM Reservations
        WHERE flat_id = flatId AND  (date_to > dateFrom AND date_from < dateTo) AND status=1
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The room is not available for the selected dates.';
    END IF;
END;

