app.post("/notknown3", async (req, res) => {
  try {
    const { accountID, CusPoint, FName, MName, LName, DOB, Gender, Address, PhoneNumber } = req.body;
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
  }
  catch(err) {
    return res.send("Server cannot send response");
  }
});