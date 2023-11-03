const express = require('express');
const bodyParser = require('body-parser');
const client = require('./client');
const exphbs = require('express-handlebars');
const path = require("path");
const app = express();
app.engine('handlebars', exphbs.engine());
app.use(bodyParser.json());
app.set('views', path.join(__dirname, '../views'));
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
  res.render('index');
});

// Register User
app.post('/register', (req, res) => {
  const { username, password } = req.body;
  client.registerUser(username, password, (error, response) => {
    if (error) {
      res.status(500).json({ error: error.message });
    } else {
      res.json(response);
    }
  });
});

// Login User
app.post('/login', (req, res) => {
  const { username, password } = req.body;
  client.loginUser(username, password, (error, response) => {
    if (error) {
      res.status(500).json({ error: error.message });
    } else {
      res.json(response);
    }
  });
});

// Update User
app.put('/update', (req, res) => {
  const { username, newPassword } = req.body;
  client.updateUser(username, newPassword, (error, response) => {
    if (error) {
      res.status(500).json({ error: error.message });
    } else {
      res.json(response);
    }
  });
});

// Delete User
app.delete('/delete', (req, res) => {
  const { username } = req.body;
  client.deleteUser(username, (error, response) => {
    if (error) {
      res.status(500).json({ error: error.message });
    } else {
      res.json(response);
    }
  });
});

// Get User
app.get('/user/:username', (req, res) => {
  const { username } = req.params;
  client.getUser(username, (error, response) => {
    if (error) {
      res.status(500).json({ error: error.message });
    } else {
      res.json(response);
    }
  });
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});