import { Router } from 'express';
import mysql from "mysql2/promise";
const router = Router();
const dbAdmin = {
    host: '127.0.0.1',
    port: 3333,
    user: 'root',
    password: 'root',
    database: 'MiniDb',
    timezone: '00:00'
};
router.get('/dashboard', (req, res) => {
    res.send('Admin Dashboard');
});


router.post("/signup", async (req, res) => {
    const {firstname, lastname, email, phoneNumber, password} = req.body;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        await connection.execute(
            "CALL addClient(?, ?, ?, ?, ?)",
            [firstname, lastname, email, phoneNumber, password]
        );
        res.status(201).send({ message: 'Admin added successfully' });
        console.log('Admin added successfully : '+ "{" + firstname +", " +lastname+", " +email+ ", " +phoneNumber+" }");
        await connection.end();
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Failed to add Admin' });
    }

})
router.get('/rooms-to-clean/today', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute("CALL GetRoomsToCleanToday()");
        res.json(results[0]);
        console.log("Rooms to clean today: "+results[0])
        await connection.end();

    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/rooms-to-clean/:date', async (req, res) => {
    const  date  = req.params.date;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute("CALL GetRoomsToClean(?)", [date]);
        res.json(results[0]);
        console.log("Rooms to clean "+date+": "+results[0])
        await connection.end();
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});

router.get('/reservations', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [reservations] = await connection.query('SELECT * FROM Reservations');
        await connection.end();
        res.json(reservations);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/reservations/client/:clientId', async (req, res) => {
    const clientId = req.params.clientId;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [reservations] = await connection.query('SELECT * FROM Reservations WHERE client_id = ?', [clientId]);
        await connection.end();
        res.json(reservations);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/reservations/:reservationId', async (req, res) => {
    const reservationId = req.params.reservationId;
    console.log(reservationId)
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [result] = await connection.execute(
            "SELECT * FROM Reservations WHERE reservation_id=?",
            [reservationId]
        );
        if (result.length > 0) {
            res.json(result[0]);
        } else {
            res.status(404).send({ message: 'Reservation not found' });
        }
        await connection.end();
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});



router.get('/client', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [client] = await connection.query('SELECT * FROM Clients');
        await connection.end();
        res.json(client);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/client/:clientId', async (req, res) => {
    const clientId = req.params.clientId;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [client] = await connection.query('SELECT * FROM Clients WHERE client_id = ?', [clientId]);
        await connection.end();
        res.json(client);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/currently-occupied-rooms', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [rooms] = await connection.query("SELECT * FROM CurrentlyOccupiedRooms");
        await connection.end();
        res.json(rooms);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/cancelled-reservations', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [result] = await connection.execute("SELECT * FROM AllCancelledReservations");
        await connection.end();
        res.json(result);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/cancelled-reservations/:year/:month', async (req, res) => {
    const { year, month } = req.params;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute(
            "CALL ShowCancelledReservations(?, ?)",
            [year, month]
        );
        await connection.end();
        res.json(results);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/reservations-to-refund', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [refundReservations] = await connection.execute("SELECT * FROM ReservationsToRefund");
        await connection.end();
        res.json(refundReservations);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/report/:year/:month', async (req, res) => {
    const { year, month } = req.params;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute("CALL MonthlyFinancialReport(?, ?)", [parseInt(year), parseInt(month)]);
        await connection.end();
        res.json(results[0]);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/report-previous-month', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute("CALL MonthlyFinancialReportPreviousMonth()");
        await connection.end();
        res.json(results[0]);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.post('/refund-reservation', async (req, res) => {
    const { adminId, reservationId, amountToRefund } = req.body;
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute(
            "CALL RefundReservation(?, ?, ?)",
            [adminId, reservationId, parseFloat(amountToRefund)]
        );
        await connection.end();
        res.json({ message: 'Refund processed successfully', details: results });
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error', error: error.message });
    }
});
router.get('/returned-payments/:adminId', async (req, res) => {
    const adminId = parseInt(req.params.adminId);
    try {
        const connection = await mysql.createConnection(dbAdmin);
        const [results] = await connection.execute(
            "CALL ShowReturnedPaymentsByAdmin(?)",
            [adminSetAdminId]
        );
        await connection.end();
        res.json(results[0]);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});
router.get('/payment-history/:clientId', async (req, res) => {
    const clientId = parseInt(req.params.clientId);
    try {
        const connection = await mysql.createConnection(dbAdmin);
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



export default router;
