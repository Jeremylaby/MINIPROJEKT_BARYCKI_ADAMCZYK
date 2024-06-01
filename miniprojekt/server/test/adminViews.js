

async function fetchCancelledReservations() {
    try {
        const response = await fetch('http://localhost:3000/admin/cancelled-reservations');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const cancelledReservations = await response.json();
        console.log('Cancelled reservations:', cancelledReservations);
    } catch (error) {
        console.error('Error fetching cancelled reservations:', error);
    }
}
async function fetchRefundReservations() {
    try {
        const response = await fetch('http://localhost:3000/admin/refund-reservations');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const refundReservations = await response.json();
        console.log('Reservations to refund:', refundReservations);
    } catch (error) {
        console.error('Error fetching reservations to refund:', error);
    }
}
async function fetchCurrentlyOccupiedRooms() {
    try {
        const response = await fetch('http://localhost:3000/admin/currently-occupied-rooms');
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const rooms = await response.json();
        console.log('Currently occupied rooms:', rooms);
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}
async function fetchCancelledReservationsByDate(year, month) {
    const url = `http://localhost:3000/admin/cancelled-reservations/${year}/${month}`;
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const reservations = await response.json();
        console.log('Cancelled reservations for given period:', reservations);
    } catch (error) {
        console.error('Error fetching cancelled reservations:', error);
    }
}

fetchCancelledReservationsByDate(2024, 4);

// fetchCurrentlyOccupiedRooms();
//
// fetchRefundReservations();

fetchCancelledReservations();


