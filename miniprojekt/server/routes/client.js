import {Router} from 'express';
import mysql from 'mysql2/promise';

const router = Router();
const dbClient = {
    host: '127.0.0.1',
    port: 3333,
    user: 'client',
    password: 'client',
    database: 'MiniDb',
    timezone: '00:00'
};
router.get('/profile', (req, res) => {
    res.send('Client Profile');
});




router.post('/payment-history', async (req, res) => {
    const { email } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            return;
        }
        const clientId = client[0][0].client_id;

        const [results] = await connection.execute(
            "CALL ShowPaymentHistory(?)",
            [clientId]
        );
        await connection.end();
        res.json(results[0]);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});

router.post('/cancel-reservation', async (req, res) => {
    const { email, reservationId } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            return;
        }
        const clientId = client[0][0].client_id;

        const [results] = await connection.execute(
            "CALL CancelFutureReservation(?, ?)",
            [clientId, reservationId]
        );
        await connection.end();
        console.log('Reservation cancelled successfully')
        res.send( {message: 'Reservation cancelled successfully' });
    } catch (error) {
        console.error('Database error:', error);
        if (error.sqlState === '45000') {
            res.status(400).send({ message: error.message });
        } else {
            res.status(500).send({ message: 'Internal server error' });
        }
    }
});
router.post('/update-reservation-date', async (req, res) => {
    const { reservationId, email, newDateFrom, newDateTo } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            console.log('Client not found')
            return;
        }
        const clientId = client[0][0].client_id;
        await connection.execute(
            "CALL UpdateReservationDate(?, ?, ?, ?)",
            [reservationId, clientId, newDateFrom, newDateTo]
        );
        await connection.end();
        res.send({ message: 'Reservation dates updated successfully' });
        console.log('Reservation dates updated successfully')
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});


router.post('/update-reservation-date-from', async (req, res) => {
    const { reservationId, email, newDateFrom } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            return;
        }
        const clientId = client[0][0].client_id;
        await connection.execute(
            "CALL UpdateReservationDateFrom(?, ?, ?)",
            [reservationId, clientId, newDateFrom]
        );
        await connection.end();
        res.send({ message: 'Reservation start date updated successfully' });
        console.log('Reservation start date updated successfully' )
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});


router.post('/update-reservation-date-to', async (req, res) => {
    const { reservationId, email, newDateTo } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            return;
        }
        const clientId = client[0][0].client_id;
        await connection.execute(
            "CALL UpdateReservationDateTo(?, ?, ?)",
            [reservationId, clientId, newDateTo]
        );
        await connection.end();
        res.send({ message: 'Reservation end date updated successfully' });
        console.log('Reservation end date updated successfully')
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.post('/add-reservation', async (req, res) => {
    const { email, flatId, dateFrom, dateTo, numPeople } = req.body;
    try {
        const connection = await mysql.createConnection(dbClient);
        const [client] = await connection.execute(
            "CALL GetClientId(?)",
            [email]
        );
        if (client.length === 0) {
            res.status(404).send({ message: 'Client not found' });
            return;
        }
        const clientId = client[0][0].client_id;

        const [results] = await connection.execute(
            "CALL AddReservation(?, ?, ?, ?, ?)",
            [clientId, flatId, dateFrom, dateTo,  numPeople]
        );
        await connection.end();
        res.send({ message: 'Reservation added successfully'});
    } catch (error) {
        console.error('Database error:', error);
        if (error.sqlState === '45000') {
            res.status(400).send({ message: error.message });
        } else {
            res.status(500).send({ message: 'Internal server error' });
        }
    }
});
export default router;
