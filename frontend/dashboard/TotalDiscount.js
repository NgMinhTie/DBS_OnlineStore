async function calculateTotalDiscount(AccountID) {
    try {
      const response = await fetch("/TotalDiscount", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          AccountID
        }),
      });
      if (response) {
        //console.log('Insert the data successfully', response);
        alert("Calculate Total Discount successfully");
      } else {
        console.log("The server does not response");
        alert("Calculate Total Discount successfully failed");
      }
    } catch (err) {
      alert("The server does not response");
    }
}