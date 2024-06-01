async function fetchRoomsToCleanByDate(date) {
    try {
        const response = await fetch(`http://localhost:3000/admin/rooms-to-clean/${date}`, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        console.log('Rooms to be cleaned:', data);
    } catch (error) {
        console.error('Error fetching rooms to clean:', error);
    }
}
async function fetchRoomsToCleanToday() {
    try {
        const response = await fetch('http://localhost:3000/admin/rooms-to-clean/today', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data = await response.json();
        console.log('Rooms to be cleaned today:', data);
    } catch (error) {
        console.error('Error fetching rooms to clean today:', error);
    }
}

fetchRoomsToCleanToday();
fetchRoomsToCleanByDate('2024-06-09');
