const express = require("express");
const mysql = require("mysql2");
// const cors = require('cors'); // Thêm dòng này
const cors = require("cors");

const app = express();
app.use(express.json());

//app.use(bodyParser.json({ type: "application/json", strict: true }));
// app.use(cors()); // Thêm dòng này
const PORT = 100;
const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "iELTS6.5.",
  database: "cellphone",
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
app.use(
  cors({
    origin: "*", // Allow only frontend from localhost:5501
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type"],
  })
);

pool.connect(function (err) {
  if (err) console.log("Failed");
  else console.log("Successful");
});

//* PROCEDURE FOR SELECTING PROCEDURE
app.post("/as", async (req, res) => {
  try {
    // Execute the query
    const [result] = await pool.promise().query("SELECT * from Customer");
    return res.status(200).json(result);
  } catch (err) {}
});

app.get("/getCustomerList", async (req, res) => {
  try {
    const [result] = await pool.promise().query("SELECT * FROM Customer");

    // Log dữ liệu dưới dạng JSON
    //console.log("Customer list:", JSON.stringify(result, null, 2));
    console.log("DEBUG Backend");
    // Trả dữ liệu về client
    return res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching customer list:", err.message);

    // Trả lỗi nếu có
    return res.status(500).send("Error fetching customer list");
  }
});
//SUCCESSFUL
app.get("/getBranchList", async (req, res) => {
  try {
    const [result] = await pool.promise().query("SELECT * FROM Branch");

    // Log dữ liệu dưới dạng JSON
    //console.log("Customer list:", JSON.stringify(result, null, 2));
    console.log("DEBUG Backend");
    // Trả dữ liệu về client
    return res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching cbranch list:", err.message);

    // Trả lỗi nếu có
    return res.status(500).send("Error fetching branch list");
  }
});

//SUCCESSFUL
app.get("/getDeviceList", async (req, res) => {
  try {
    const [result] = await pool
      .promise()
      .query(
        "SELECT DeviceID, DeviceName, Status, DevicePrice FROM devicetype JOIN device"
      );

    // Log dữ liệu dưới dạng JSON
    //console.log("Customer list:", JSON.stringify(result, null, 2));
    console.log("DEBUG Backend");
    // Trả dữ liệu về client
    return res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching device list:", err.message);

    // Trả lỗi nếu có
    return res.status(500).send("Error fetching device list");
  }
});
//!NOT SUCCESSFUL BECAUSE OF WRONG DATA TYPE
app.post("/notknown1", async (req, res) => {
  try {
    //      {
    //     "accountID" : "CP123456789"

    //  }
    const { customerID } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL GetCustomerDetails(?)", [customerID]);
    console.log("Data sent to client:", result); // Thêm dòng này để kiểm tra dữ liệu gửi đi
    // return res.status(200).json({ result });

    if (result && result.length > 0) {
      console.log("Find out the customer successfully");
      res.status(200).json({
        success: true,
        data: result,
        message: "Find out the customer successfully",
      });
    } else {
      console.log("Cannot find the customer");
      res.status(200).json({
        success: false,
        data: result[0],
        message: "Cannot find out the user",
      });
    }
  } catch (err) {
    console.error("Cannot select:", err.message);
    return res.status(500).send("Cannot Select");
  }
});

//SUCCESSFUL
app.get("/getCustomerList", async (req, res) => {
  try {
    const [result] = await pool.promise().query("SELECT * FROM Customer");

    // Log dữ liệu dưới dạng JSON
    //console.log("Customer list:", JSON.stringify(result, null, 2));
    console.log("DEBUG Backend");
    // Trả dữ liệu về client
    return res.status(200).json(result);
  } catch (err) {
    console.error("Error fetching customer list:", err.message);

    // Trả lỗi nếu có
    return res.status(500).send("Error fetching customer list");
  }
});

//SUCCESSFUL
app.post("/SalesReport", async (req, res) => {
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
    // const [result] = await pool
    //   .promise()
    //   .query("CALL GetBranchSalesReport(?, ?, ?, ?, ?)", [
    //     BranchID[0],
    //     StartMonth[0],
    //     StartYear[0],
    //     EndMonth[0],
    //     EndYear[0],
    //   ]);

    // const [result2] = await pool
    //   .promise()
    //   .query("CALL GetBranchSalesReport(?, ?, ?, ?, ?)", [
    //     BranchID[1],
    //     StartMonth[1],
    //     StartYear[1],
    //     EndMonth[1],
    //     EndYear[1],
    //   ]);
    const lengthArray = BranchID.length;
    const result = [];
    for (let i = 0; i < lengthArray; i++) {
      result[i] = [
        BranchID[i],
        StartMonth[i],
        StartYear[i],
        EndMonth[i],
        EndYear[i],
      ];
      result[i] = await pool
        .promise()
        .query("CALL GetBranchSalesReport(?, ?, ?, ?, ?)", [
          BranchID[i],
          StartMonth[i],
          StartYear[i],
          EndMonth[i],
          EndYear[i],
        ]);
    }
    const extractedData = result
      .flat(Infinity) // Flatten all nested arrays
      .filter((item) => item && item.BranchID) // Keep only objects with a BranchID
      .map(({ BranchID, BranchName, TotalBills, TotalSales }) => ({
        BranchID,
        BranchName,
        TotalBills,
        TotalSales,
      })); // Extract the desired fields

    // Send the cleaned data in the response
    return res.status(200).json({ extractedData });
    // const customerDetails = result[0];
    // const phoneNumbers = result[1];
    // const vouchers = result[2];

    return res.status(200).json({
      // BranchID: result[0].BranchID[0],
      // StartMonth: result[0].StartMonth,
      // StartYear: result[0].StartYear,
      // EndMonth: result[0].StartMonth,
      // EndYear: result[0].EndMonth
      result,
    });
  } catch (err) {
    console.error("Cannot select:", err.message);
    return res.status(500).send("Cannot Select");
  }
});
//* PROCEDURE FOR SELECTING PROCEDURE

//! NOT SUCCESS BECAUSE OF DATA TYPE
app.post("/link_ve_BE", async (req, res) => {
  //* BODY REQUEST
  // {
  //   "accountID" : "CP901234567",
  //   "CusPoint": 12,
  //   "FName": "Steven",
  //   "MName": "Nguyen",
  //   "LName": "Minh",
  //   "DOB": "2003-12-30",
  //   "Gender": "Male",
  //   "Address": "None",
  //

  // }
  //*
  try {
    const { accountID, point, firstName, middleName, lastName, dob, gender, address, phoneNumber } =
      req.body;
    const result = await pool
      .promise()
      .query("CALL AddNewCustomer(?, ?, ?, ?, ?, ?, ?, ?, ?)", [
        accountID,
        point,
        firstName,
        middleName,
        lastName,
        dob,
        gender,
        address,
        phoneNumber
      ]);
    console.log("Running in backend");
    //const query_result = await pool.promise().query("SELECT * from customer");
    return res.send(`Insert successful Customer ${accountID}`);
    //return res.status(200).send(result);
    return res.send(query_result); //* TEST SUCCESSFUL
  } catch (err) {
    return res.status(404).send("Server cannot send response");
  }
});
//* PROCEDURE FOR INSERTING

//! CODE BELOW IS IMPLEMENTING BACKEND BUT NOT HAVING DATA
app.post("/updateCustomerPoint", async (req, res) => {
  try {
    const { accountID, NewPoints, firstName, middleName, lastName, dob, gender, address } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL UpdateCustomerPoints(?,?,?,?,?,?,?,?)", [accountID, NewPoints, firstName, middleName, lastName, dob, gender, address]);
    return res.send("Updating successfully");
  } catch (err) {
    return res.send("Server cannot send response");
  }
});

app.post("/notknown5", async (req, res) => {
  try {
    const { PhoneNumber } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL DeleteCustomer(?)", [PhoneNumber]);
    if (result) {
      return res.status(200).json({
        success: true,
        data: result,
        message: `The Phone Number ${PhoneNumber} is Unvalid`,
      });
    }
  } catch (err) {
    return res.send("Server cannot send response");
  }
});

//* FUNCTION
app.post("/TotalDiscount", async (req, res) => {
  try {
    const { AccountID } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL CalculateTotalDiscount(?) AS TotalDiscount", [AccountID]);
    const totaldiscount = result.TotalDiscount;
    return res
      .status(200)
      .json({
        success: true,
        data: totaldiscount,
        message: `Calculating successfully of AccountID ${AccountID}`,
      });
    //return res.send(`Calculating successfully ${totaldiscount}`);
  } catch (err) {
    return res
      .status(500)
      .json({ success: false, message: `The server cannot response` });
  }
});

app.post("/notknown7", async (req, res) => {
  try {
    const { PhoneNumber } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL ValidatePhoneNumber(?) AS Valid", [PhoneNumber]);
    const valid = result.Valid;
    if (valid === true) {
      return res.status(200).json({
        success: true,
        data: valid,
        message: `The Phone Number ${PhoneNumber} is Valid`,
      });
    } else {
      return res.status(200).json({
        success: true,
        data: valid,
        message: `The Phone Number ${PhoneNumber} is Unvalid`,
      });
    }
  } catch (err) {
    return res
      .status(500)
      .json({ success: false, message: `The server cannot response` });
  }
});

app.post("/deleteCustomer", async (req, res) => {
  try {
    const { AccountID } = req.body;
    const [result] = await pool
      .promise()
      .query("CALL deleteCustomer(?)", [AccountID]);
    return res.status(200).json({
      success: true,
      data: result,
      message: `The AccountID ${AccountID} is deleted`,
      });
  } catch (err) {
    return res
      .status(500)
      .json({ success: false, message: `The server cannot response` });
  }
});


//* TEST CONNECTION
// const query = 'SELECT * FROM customer';

// pool.query(query, (err, result) => {
//   if (err) {
//     console.log("Cannot query");
//   }
//   else console.log(result);
// })
