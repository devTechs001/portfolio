const express = require('express');
const cors = require('cors');
const db = require('./config/db');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

// Routes
app.post('/api/contact', async (req, res) => {
    try {
        const { name, email, subject, phone, message } = req.body;
        
        const [result] = await db.execute(
            'INSERT INTO contact_messages (name, email, subject, phone, message) VALUES (?, ?, ?, ?, ?)',
            [name, email, subject, phone, message]
        );

        res.status(201).json({ message: 'Message sent successfully' });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ error: 'Failed to send message' });
    }
});

// Start server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});