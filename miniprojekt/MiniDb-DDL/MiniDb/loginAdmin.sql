create
    definer = root@`%` procedure loginAdmin(IN in_email varchar(320), IN in_password varchar(100))
BEGIN
    DECLARE adminID INT;
    DECLARE correctPassword varchar(100);
    SELECT admin_id, password INTO adminID, correctPassword
    FROM Admins
    WHERE email = in_email;
    IF correctPassword IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user found.';
    ELSEIF correctPassword=in_password THEN
        SELECT adminID AS admin_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password.';
    END IF;
END;

grant execute on procedure loginAdmin to guest;

