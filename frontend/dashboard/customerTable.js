export async function fetchCustomerData() {
  try {
    const response = await fetch("/getCustomerList", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });
      const data = await response.json();
      if (data) {
          console.log("Data received from server:", response.json()); // Thêm dòng này để kiểm tra dữ liệu nhận được
          populateCustomerTable(data);
      }
      else {
          console.log("No data received from server");
      }
  } catch (error) {
    console.error("Error fetching customer data:", error);
  }
}

export function populateCustomerTable(customers) {
  const tableBody = document.getElementById("customer-table-body");
  tableBody.innerHTML = ""; // Clear existing content

  customers.forEach((customer) => {
    const row = document.createElement("tr");
    row.innerHTML = `
            <td>${customer.AccountID}</td>
            <td>${customer.CusPoint}</td>
            <td>${customer.FName} ${customer.MName} ${customer.LName}</td>
            <td>${customer.DOB}</td>
            <td>${customer.Gender}</td>
            <td>${customer.Address}</td>
        `;
    tableBody.appendChild(row);
  });
}
