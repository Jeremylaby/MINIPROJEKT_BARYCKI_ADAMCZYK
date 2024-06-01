async function findAvailableFlats(dateFrom,dateTo,numPeople,withKitchen) {
    const url = 'http://localhost:3000/findAvailableFlats';
    const data = {
        dateFrom:dateFrom,
        dateTo: dateTo,
        numPeople:numPeople,
        withKitchen:withKitchen
    };

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const result = await response.json();
        console.log('Success:', result);
    } catch (error) {
        console.error('Error during finding flats:', error);
    }
}
async function allFlats() {
    const url = 'http://localhost:3000/all-flats';
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const flats = await response.json();
        console.log('All flats:', flats);
    } catch (error) {
        console.error('Error fetching all flats:', error);
    }
}

allFlats();

findAvailableFlats("2024-06-13","2024-06-20",0,0);