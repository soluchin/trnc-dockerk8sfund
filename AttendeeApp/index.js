const express = require('express');
const path = require('path');
const repository = require('./repository');

const app = express();
const port = 3000;

app.use(express.json());

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.send('Hello, Express with MySQL!');
});

app.get('/attendees', (req, res) => {
  repository.getAttendees((err, attendees) => {
    if (err) {
      return res.status(500).send('Error retrieving attendees');
    }
    res.json(attendees);
  });
});

app.post('/attendees', (req, res) => {
  const { name } = req.body;
  repository.insertAttendees(name, (err, result) => {
    if (err) {
      return res.status(500).send('Error inserting attendee');
    }
    res.json({ insertId: result.insertId });
  });
});

// Listen on port 3000
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
