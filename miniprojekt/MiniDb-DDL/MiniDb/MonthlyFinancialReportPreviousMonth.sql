create
    definer = root@`%` procedure MonthlyFinancialReportPreviousMonth()
BEGIN
    DECLARE reportYear INT;
    DECLARE reportMonth INT;

    SET reportYear = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);
    SET reportMonth = MONTH(CURRENT_DATE - INTERVAL 1 MONTH);
    CALL MonthlyFinancialReport(reportYear,reportMonth);
END;

