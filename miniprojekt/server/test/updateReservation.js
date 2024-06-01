
async function updateReservationDate(reservationId, email, newDateFrom, newDateTo) {
    const url = 'http://localhost:3000/client/update-reservation-date';
    const body = { reservationId, email, newDateFrom, newDateTo };

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });

        const result = await response.json();
        if (!response.ok) {
            console.error('Error:', result);
        } else {
            console.log('Success:', result);
        }
    } catch (error) {
        console.error('Network or other error:', error);
    }
}




async function updateReservationDateFrom(reservationId, email, newDateFrom) {
    const url = 'http://localhost:3000/client/update-reservation-date-from';
    const body = { reservationId, email, newDateFrom };

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });

        const result = await response.json();
        if (!response.ok) {
            console.error('Error:', result);
        } else {
            console.log('Success:', result);
        }
    } catch (error) {
        console.error('Network or other error:', error);
    }
}
async function updateReservationDateTo(reservationId, email, newDateTo) {
    const url = 'http://localhost:3000/client/update-reservation-date-to';
    const body = { reservationId, email, newDateTo };

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(body)
        });

        const result = await response.json();
        if (!response.ok) {
            console.error('Error:', result);
        } else {
            console.log('Success:', result);
        }
    } catch (error) {
        console.error('Network or other error:', error);
    }
}


//updateReservationDate(8, "katarzyna.wojcik@example.com", '2024-06-07', '2024-06-10');
// updateReservationDateFrom(8, "katarzyna.wojcik@example.com", '2024-06-09');
updateReservationDateTo(1, "jan.kowalski@example.com", '2024-06-05');
