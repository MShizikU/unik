
const db = require("../models");
const config = require("../config/auth.config");
const User = db.user;
const Role = db.role;
const Agr = db.agr;

const Op = db.Sequelize.Op;

var jwt = require("jsonwebtoken");
var bcrypt = require("bcryptjs");

exports.allAccess = (req, res) => {
  res.status(200).send("Public Content.");
};

exports.userBoard = (req, res) => {
  Agr.findAll({order: [['id', 'ASC']]})
    .then((agrs) => {
      res.status(200).send({
        message: "User Content.",
        agrs: agrs
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};

exports.adminBoard = (req, res) => {
  Agr.findAll({order: [['id', 'ASC']]})
    .then((agrs) => {
      res.status(200).send({
        message: "Admin Content.",
        agrs: agrs
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};

exports.moderatorBoard = (req, res) => {
  Agr.findAll({order: [['id', 'ASC']]})
    .then((agrs) => {
      res.status(200).send({
        message: "Moderatior Content.",
        agrs: agrs
      });
    })
    .catch((err) => {
      res.status(500).send({ message: err.message });
    });
};
