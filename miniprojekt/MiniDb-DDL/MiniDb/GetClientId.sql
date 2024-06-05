create
    definer = root@`%` procedure GetClientId(IN in_email varchar(320))
BEGIN
    DECLARE clientID INT;
    SELECT client_id INTO clientID FROM Clients WHERE email=in_email;
    IF clientID is null THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Client not found';
    ELSE
        SELECT clientID AS client_id;
    END IF;
end;

grant execute on procedure GetClientId to client;

