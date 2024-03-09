const express = require("express");
const cors = require("cors");

var bcrypt = require("bcryptjs");

const app = express();

var corsOptions = {
  origin: "http://localhost:8081"
};

app.use(cors(corsOptions));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

const db = require("./app/models");
const Role = db.role;
const Agr = db.agr;

db.sequelize.sync({force: true}).then(() => {
  console.log('Drop and Resync Database with { force: true }');
  initial();
});

// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to bezkoder application." });
});

// routes
require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);
require('./app/routes/agr.routes')(app);


// set port, listen for requests
const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});

function initial() {
  Agr.create({
    name: "Agr1",
    status: "Active"
  }).then(() => {
    console.log("Agr1 created successfully.");
  });

  Agr.create({
    name: "Agr2",
    status: "Inactive"
  }).then(() => {
    console.log("Agr2 created successfully.");
  });

  Agr.create({
    name: "Agr3",
    status: "Pending"
  }).then(() => {
    console.log("Agr3 created successfully.");
  });

  Role.create({
    id: 1,
    name: "user"
  }).then(() => {
    Role.create({
      id: 2,
      name: "moderator"
    }).then(() => {
      Role.create({
        id: 3,
        name: "admin"
      }).then(() => {
        const User = db.user;
        User.create({
          username: "user",
          email: "user@example.com",
          password: bcrypt.hashSync("123321", 8)
        }).then((user1) => {
          user1.setRoles([1]).then(() => {
            console.log("User 1 with role 'user' created successfully.");
          });
        });

        User.create({
          username: "mod",
          email: "mod@gmail.com",
          password: bcrypt.hashSync("123321", 8)
        }).then((user2) => {
          user2.setRoles([1,2]).then(() => {
            console.log("User 2 with role 'moderator' created successfully.");
          });
        });

        User.create({
          username: "admin",
          email: "admin@gmail.com",
          password: bcrypt.hashSync("123321", 8)
        }).then((user3) => {
          user3.setRoles([1,2,3]).then(() => {
            console.log("User 3 with role 'admin' created successfully.");
          });
        });
      });
    });
  });
}