async function fetchMonthlyFinancialReport(year, month) {
    try {
        const response = await fetch(`http://localhost:3000/admin/report/${year}/${month}`);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const result = await response.json();
        console.log('Monthly financial report:', result);
    } catch (error) {
        console.error('Error fetching monthly financial report:', error);
    }
}

async function fetchMonthlyFinancialReportPreviousMonth() {
    try {
        const response = await fetch('http://localhost:3000/admin/report-previous-month');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const result = await response.json();
        console.log('Monthly financial report for previous month:', result);
    } catch (error) {
        console.error('Error fetching monthly financial report for previous month:', error);
    }
}

fetchMonthlyFinancialReportPreviousMonth()
fetchMonthlyFinancialReport(2024, 5 );
