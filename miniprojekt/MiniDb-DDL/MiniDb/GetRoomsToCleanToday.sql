create
    definer = root@`%` procedure GetRoomsToCleanToday()
BEGIN
    CALL GetRoomsToClean(curdate());
end;

