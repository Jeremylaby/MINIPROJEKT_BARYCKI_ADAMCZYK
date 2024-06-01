async function testRefundReservation(adminId, reservationId, amountToRefund) {
    const url = 'http://localhost:3000/admin/refund-reservation';
    const body = {
        adminId,
        reservationId,
        amountToRefund
    };

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(body)
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        console.log('Refund successful:', data);
    } catch (error) {
        console.error('Error testing refund reservation:', error);
    }
}
async function fetchReturnedPaymentsByAdmin(adminId) {
    const url = `http://localhost:3000/returned-payments/${adminId}`;
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const payments = await response.json();
        console.log('Returned payments by admin:', payments);
    } catch (error) {
        console.error('Error fetching returned payments by admin:', error);
    }
}

fetchReturnedPaymentsByAdmin(1);

testRefundReservation(2 , 20, 300.00);
