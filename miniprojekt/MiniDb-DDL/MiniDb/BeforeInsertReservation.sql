create definer = root@`%` trigger BeforeInsertReservation
    before insert
    on Reservations
    for each row
BEGIN
#     IF NEW.date_from<curdate() THEN
#         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'You cannot set date_from to a past date' ;
#     END IF;
    IF NEW.date_from >= NEW.date_to THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'date_from must be less than date_to.';
    END IF;
END;

