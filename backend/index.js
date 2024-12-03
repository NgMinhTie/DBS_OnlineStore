const express = require('express');
const mysql = require('mysql2')

const app = express();
const PORT = 3306;
const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "iELTS6.5.",
  database: "cellphone",
});
    

pool.connect(function (err) {
    if (err)
        console.log("Failed")
    else console.log("Successful")
})

const query = 'SELECT * FROM customer';

pool.query(query, (err, result) => {
  if (err) {
    console.log("Cannot query");
  }
  else console.log(result);
})