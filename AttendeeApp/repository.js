const mysql = require('mysql2');
const db = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || '9901',
  user: process.env.DB_USER || 'node',
  password: process.env.DB_PASSWORD || 'node123',
  database: process.env.DB_NAME || 'mydb'
});

// Connect to MySQL
db.connect((err) => {
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    return;
  }
  console.log('Connected to MySQL database');
});

function getAttendees(callback) {
  const sql = 'SELECT * FROM daftar_hadir';

  db.query(sql, (err, res) => {
    if (err) return callback(err, null);

    callback(null, res);
  });
}

function insertAttendees(name, callback) {
  const sql = 'INSERT INTO daftar_hadir SET ?';

  db.query(sql, { name: name }, (err, res) => {
    if (err) return callback(err, null);

    callback(null, res);
  });
}

module.exports = {
  getAttendees, insertAttendees
}
