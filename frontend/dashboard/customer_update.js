//import{fetchTable1Data} from database.js
//import { populateCustomerTable } from "./customerTable.js";
//import { fetchCustomerData } from "./customerTable.js";
//import { populateCustomerTable } from "./customerTable";
document.getElementById('update-button-table3').addEventListener('click', function() {
    // Check if the modal already exists
    if (document.getElementById('customer-update-modal')) {
        document.getElementById('customer-update-modal').style.display = 'block';
        return;
    }

    // Create the modal
    const modal = document.createElement('div');
    modal.id = 'customer-update-modal';
    modal.className = 'modal';
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close">&times;</span>
            <form id="customer-update-form" class="insert-form">
                <label for="update-account-id">Account ID:</label>
                <input type="text" id="update-account-id" name="account-id" required><br>
                <label for="update-point">Point:</label>
                <input type="text" id="update-point" name="point" required><br>
                <label for="update-first-name">First Name:</label>
                <input type="text" id="update-first-name" name="first-name" required><br>
                <label for="update-middle-name">Middle Name:</label>
                <input type="text" id="update-middle-name" name="middle-name" required><br>
                <label for="update-last-name">Last Name:</label>
                <input type="text" id="update-last-name" name="last-name" required><br>
                <label for="update-dob">Date of Birth:</label>
                <input type="date" id="update-dob" name="dob" required><br>
                <label for="update-gender">Gender:</label>
                <select id="update-gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br>
                <label for="update-address">Address:</label>
                <input type="text" id="update-address" name="address" required><br>
                <button type="submit">Submit</button>
            </form>
        </div>
    `;

    // Append the modal to the body
    document.body.appendChild(modal);

    // Display the modal
    modal.style.display = 'block';

    // Get the <span> element that closes the modal
    const span = modal.getElementsByClassName('close')[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = 'none';
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }

//! ADD IT INTO TABLE
async function UpdateNewCustomer(
          accountID,
          NewPoints,
          firstName,
          middleName,
          lastName,
          dob,
          gender,
          address
) {
   try {
     const response = await fetch(
       "http://localhost:100/updateCustomerPoint",
       {
         method: "POST",
         headers: {
           "Content-Type": "application/json",
         },
         body: JSON.stringify({
           accountID,
           NewPoints,
           firstName,
           middleName,
           lastName,
           dob,
           gender,
           address,
         }),
       }
     );
     if (response) {
       //console.log('Insert the data successfully', response);
         alert("Customer updated successfully");
         fetchCustomerData();
     } else {
       console.log("The server does not response");
       alert("Customer updated failed");
     }
   } catch (err) {
     alert("The server does not response");
   }
        }
    // Handle form submission
    document.getElementById('customer-update-form').addEventListener('submit', function(event) {
        event.preventDefault();

        // Collect form data
        const accountID = document.getElementById('update-account-id').value;
        const pointString = document.getElementById("update-point").value;
        const firstName = document.getElementById('update-first-name').value;
        const middleName = document.getElementById('update-middle-name').value;
        const lastName = document.getElementById('update-last-name').value;
        const dob = document.getElementById('update-dob').value;
        const gender = document.getElementById('update-gender').value;
        const address = document.getElementById('update-address').value;

        const point = parseInt(pointString);
        UpdateNewCustomer(
          accountID,
          point,
          firstName,
          middleName,
          lastName,
          dob,
          gender,
          address
        );
        // Check for existing ID and update
        const tableBody = document.getElementById('customer-table-body');
        const rows = tableBody.getElementsByTagName('tr');
        let found = false;
        for (let row of rows) {
            const cells = row.getElementsByTagName('td');
            if (cells[0].textContent === accountId) {
                // Remove the existing row
                tableBody.removeChild(row);
                found = true;
                break;
            }
        }

        if (!found) {
            alert('No customer data');
            return;
        }

        // Create a new row in the customer table
        const newRow = document.createElement('tr');
        newRow.innerHTML = `
            <td>${accountId}</td>
            <td>${point}</td>
            <td>${firstName}</td>
            <td>${middleName}</td>
            <td>${lastName}</td>
            <td>${dob}</td>
            <td>${gender}</td>
            <td>${address}</td>
        `;
        tableBody.appendChild(newRow);

        // Close the modal after submission
        modal.style.display = 'none';
    });
});
