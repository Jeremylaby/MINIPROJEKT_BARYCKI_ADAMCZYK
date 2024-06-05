create
    definer = root@`%` procedure addClient(IN in_firstname text, IN in_lastname text, IN in_email varchar(320),
                                           IN in_phone_number varchar(15), IN in_password varchar(100))
BEGIN
    INSERT INTO Clients (firstname, lastname, email, phone_number, password)
    VALUES (in_firstname, in_lastname, in_email, in_phone_number, in_password);
END;

grant execute on procedure addClient to client;

grant execute on procedure addClient to guest;

