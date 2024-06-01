async function loginClient(email,password) {
    const url = 'http://localhost:3000/loginClient';
    const data = {
        email: email,
        password: password
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
        console.log('Login successful:', result);
    } catch (error) {
        console.error('Error during login:', error.message);
    }
}
async function loginAdmin(email,password) {
    const url = 'http://localhost:3000/loginAdmin';
    const data = {
        email: email,
        password: password
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
        console.log('Login successful:', result);
    } catch (error) {
        console.error('Error during login:', error.message);
    }
}

loginClient("jan.kowalski@example.com","haslo3");
loginAdmin("admin1@example.com","haslo1")