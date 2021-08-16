const mysql = require('mysql');

const pool = mysql.createPool({
  connectionLimit: 10,
  password: "123456789",
  user: "rindra",
  database: "excellence",
  host: "localhost"
});

module.exports = pool;
