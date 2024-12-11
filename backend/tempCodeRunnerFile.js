pp.post("/notknown1", async (req, res) => {
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