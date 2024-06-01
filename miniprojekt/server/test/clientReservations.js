
async function cancelReservation(email, reservationId) {
    const url = 'http://localhost:3000/client/cancel-reservation';  // Zmień URL jeśli potrzebujesz
    const body = {
        email,
        reservationId
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

        const result = await response.json();
        console.log('Cancel reservation response:', result);
    } catch (error) {
        console.error('Error testing cancel reservation:', error);
    }
}
async function addReservation(email, flatId, dateFrom, dateTo, numPeople) {
    const url = 'http://localhost:3000/client/add-reservation';
    const body = {
        email,
        flatId,
        dateFrom,
        dateTo,
        numPeople
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

        const result = await response.json();
        console.log('Add reservation response:', result);
    } catch (error) {
        console.error('Error testing add reservation:', error);
    }
}
//addReservation('tomasz.zielinski@example.com', 12, '2024-06-01', '2024-06-07', 2);

// cancelReservation('zofia.stepien@example.com', 16);

