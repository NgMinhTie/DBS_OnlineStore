const express = require('express');
const mysql = require('mysql2')

const app = express();
app.use(express.json());
const PORT = 80;
const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "iELTS6.5.",
  database: "cellphone",
});
    
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

pool.connect(function (err) {
    if (err)
        console.log("Failed")
    else console.log("Successful")
})

//* PROCEDURE FOR SELECTING PROCEDURE
app.post("/notknown1", async (req, res) => {
  //* BODY REQUEST
//   {
//   "customerID": 2
// }
  //*
  try {
    // Execute the query directly
    const { customerID } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL GetCustomerDetails(?)", [customerID]);

    // const customerDetails = result[0]; 
    // const phoneNumbers = result[1];
    // const vouchers = result[2]; 
    return res.status(200).json({
      result
    });
  } catch (err) {
    console.error("Cannot select:", err.message);
    return res.status(500).send("Cannot Select");
  }
});


//!: CANNOT RUN. PLEASE DO NOT USE AS A TEST
app.post("/notknown2", async (req, res) => {
  //* BODY REQUEST
//  {
//   "BranchID": 1,
//   "StartMonth": 10,
//   "StartYear": 2002,
//   "EndMonth": 1,
//   "EndYear": 2003
// }
  //*
  try {
    // Execute the query directly
    const { BranchID, StartMonth, StartYear, EndMonth, EndYear } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL GetBranchSalesReport(?, ?, ?, ?, ?)", [
        BranchID,
        StartMonth,
        StartYear,
        EndMonth,
        EndYear,
      ]);

    // const customerDetails = result[0];
    // const phoneNumbers = result[1];
    // const vouchers = result[2];
    return res.status(200).json({
      result,
    });
  } catch (err) {
    console.error("Cannot select:", err.message);
    return res.status(500).send("Cannot Select");
  }
});
//* PROCEDURE FOR SELECTING PROCEDURE

//* PROCEDURE FOR INSERTING
app.post("/notknown3", async (req, res) => {
  //* BODY REQUEST
// {
//   "accountID" : 1,
//   "CusPoint": 12,
//   "FName": "Steven",
//   "MName": "Nguyen",
//   "LName": "Minh",
//   "DOB": "2003-12-30",
//   "Gender": "Male",
//   "Address": "None",
//   "PhoneNumber": "0457346564"
  
// }
  //*
  try {
    const {
      accountID,
      CusPoint,
      FName,
      MName,
      LName,
      DOB,
      Gender,
      Address,
      PhoneNumber,
    } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL AddNewCustomer(?, ?, ?, ?, ?, ?, ?, ?, ?)", [
        accountID,
        CusPoint,
        FName,
        MName,
        LName,
        DOB,
        Gender,
        Address,
        PhoneNumber,
      ]);

    return res.send(`Insert successful Customer ${accountID}`);
  } catch (err) {
    return res.send("Server cannot send response");
  }
});
//* PROCEDURE FOR INSERTING

//* TEST CONNECTION
// const query = 'SELECT * FROM customer';

// pool.query(query, (err, result) => {
//   if (err) {
//     console.log("Cannot query");
//   }
//   else console.log(result);
// })

