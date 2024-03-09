module.exports = {
  HOST: "localhost",
  PORT: "5435",
  USER: "postgres",
  PASSWORD: "1",
  DB: "prakt78",
  dialect: "postgres",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};