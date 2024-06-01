import express from 'express';
import bodyParser from 'body-parser';
import mysql from 'mysql2/promise';
import adminRoute from './routes/admin.js';
import clientRoute from './routes/client.js';

import router from "./routes/client.js";

const app = express();
const port = 3000;

app.use(bodyParser.json());
const dbGuest = {
    host: '127.0.0.1',
    port: 3333,
    user: 'guest',
    password: 'guest',
    database: 'MiniDb',
    timezone: '00:00'
};



app.use('/admin', adminRoute);
app.use('/client', clientRoute);
app.post('/loginClient', async (req, res) => {
    const {email, password} = req.body;
    try {
        const connection = await mysql.createConnection(dbGuest);
        const [results] = await connection.execute("CALL loginClient(?, ?)", [email, password]);
        if (results[0].length > 0) {
            res.json({message: 'Login successful', clientID: results[0][0].client_id});
            console.log("Cllient logged clientID: " + results[0][0].client_id)
        } else {
            res.status(404).send({message: 'User not found or password incorrect'});
        }
        await connection.end();
    } catch (error) {
        if (error.sqlState === '45000') {
            console.error(error.message)
            res.status(401).send({message: error.message});
        } else {
            console.error('Database error:', error);
            res.status(500).send({message: 'Server error'});
        }
    }
});
app.post('/loginAdmin', async (req, res) => {
    const { email, password } = req.body;
    try {
        const connection = await mysql.createConnection(dbGuest);
        const [results] = await connection.execute("CALL loginAdmin(?, ?)", [email, password]);
        if (results[0].length > 0) {
            res.json({ message: 'Login successful', adminID: results[0][0].admin_id });
            console.log("Admin logged adminID: " + results[0][0].admin_id)
        } else {
            res.status(404).send({ message: 'User not found or password incorrect' });
        }
        await connection.end();
    } catch (error) {
        if (error.sqlState === '45000') {
            console.error(error.message)
            res.status(401).send({ message: error.message });
        } else {
            console.error('Database error:', error);
            res.status(500).send({ message: 'Server error' });
        }
    }
});
app.post("/signup", async (req, res) => {
    const {firstname, lastname, email, phoneNumber, password} = req.body;
    try {
        const connection = await mysql.createConnection(dbGuest);
        await connection.execute(
            "CALL addClient(?, ?, ?, ?, ?)",
            [firstname, lastname, email, phoneNumber, password]
        );
        res.status(201).send({ message: 'Client added successfully' });
        console.log('Client added successfully : '+ "{" + firstname +", " +lastname+", " +email+ ", " +phoneNumber+" }");
        await connection.end();
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Failed to add client' });
    }

})
app.post("/findAvailableFlats", async (req,res)=>{
    const {dateFrom,dateTo,numPeople,withKitchen}=req.body;
    try {
        const connection = await mysql.createConnection(dbGuest);
        const [results] = await connection.execute("CALL FindAvailableFlats(?, ?, ?, ?)", [dateFrom,dateTo,numPeople,withKitchen]);
        res.json({message: 'Available flats', flats: results[0]});
        await connection.end();
    } catch (error) {
        if (error.sqlState === '45000') {
            console.error(error.message)
            res.status(401).send({message: error.message});
        } else {
            console.error('Database error:', error);
            res.status(500).send({message: 'Server error'});
        }
    }
})
app.get('/all-flats', async (req, res) => {
    try {
        const connection = await mysql.createConnection(dbGuest);
        const [rows] = await connection.query('SELECT * FROM AllFlats');
        await connection.end();
        res.json(rows);
    } catch (error) {
        console.error('Database error:', error);
        res.status(500).send({ message: 'Internal server error' });
    }
});

// Start server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});
