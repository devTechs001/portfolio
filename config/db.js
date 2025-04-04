const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '20051117dan',
    database: 'portfolio_db'
});

module.exports = pool.promise();