create
    definer = root@`%` procedure loginClient(IN in_email varchar(320), IN in_password varchar(100))
BEGIN
    DECLARE clientID INT;
    DECLARE correctPassword varchar(100);
    SELECT client_id, password INTO clientID, correctPassword
    FROM Clients
    WHERE email = in_email;
    IF correctPassword IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No such user found.';
    ELSEIF correctPassword=in_password THEN
        SELECT clientID AS client_id;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Incorrect password.';
    END IF;
END;

grant execute on procedure loginClient to client;

grant execute on procedure loginClient to guest;

