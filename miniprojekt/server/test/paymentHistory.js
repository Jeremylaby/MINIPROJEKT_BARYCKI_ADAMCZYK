async function fetchPaymentHistory(clientId) {
    try {
        const response = await fetch(`http://localhost:3000/admin/payment-history/${clientId}`);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const history = await response.json();
        console.log('Payment history:', history);
    } catch (error) {
        console.error('Error fetching payment history:', error);
    }
}
async function fetchClientPaymentHistory(email) {
    try {
        const response = await fetch('http://localhost:3000/client/payment-history', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email })
        });
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const history = await response.json();
        console.log('Client payment history:', history);
    } catch (error) {
        console.error('Error fetching client payment history:', error);
    }
}


fetchClientPaymentHistory('jan.kowalski@example.com');

fetchPaymentHistory(1);