
document
  .getElementById("insert-button-table3")
  .addEventListener("click", function () {
    // Check if the modal already exists
    if (document.getElementById("customer-insert-modal")) {
      document.getElementById("customer-insert-modal").style.display = "block";
      return;
    }

    // Create the modal
    const modal = document.createElement("div");
    modal.id = "customer-insert-modal";
    modal.className = "modal";
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close">&times;</span>
            <form id="customer-insert-form" class="insert-form">
                <label for="account-id">Account ID:</label>
                <input type="text" id="account-id" name="account-id" required><br>
                <label for="point">Point:</label>
                <input type="text" id="point" name="point" required><br>
                <label for="first-name">First Name:</label>
                <input type="text" id="first-name" name="first-name" required><br>
                <label for="middle-name">Middle Name:</label>
                <input type="text" id="middle-name" name="middle-name" required><br>
                <label for="last-name">Last Name:</label>
                <input type="text" id="last-name" name="last-name" required><br>
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required><br>
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required><br>
                <label for="phone-number">Phone Number:</label>
                <input type="text" id="phone-number" name="phone-number" required><br>
                <button type="submit">Submit</button>
            </form>
        </div>
    `;

    // Append the modal to the body
    document.body.appendChild(modal);

    // Display the modal
    modal.style.display = "block";

    // Get the <span> element that closes the modal
    const span = modal.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
      modal.style.display = "none";
    };

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    };

    // Handle form submission
    //! ADD INTO TABLE WHEN INSERT SUCCFULLY
    async function AddNewCustomer(
      accountID,
      point,
      firstName,
      middleName,
      lastName,
      dob,
      gender,
        address,
      phoneNumber,
    ) {
      try {
        const response = await fetch("http://localhost:100/link_ve_BE", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            accountID,
            point,
            firstName,
            middleName,
            lastName,
            dob,
            gender,
            address,
            phoneNumber,
          }),
        });
        if (response) {
          console.log("Insert the data successfully", response);
          alert("Customer inserted successfully");
        } else {
          console.log("The server does not response");
          alert("Customer inserted failed");
        }
      } catch (err) {
        alert("The server does not response");
      }
    }
    document
      .getElementById("customer-insert-form")
      .addEventListener("submit", function (event) {
        event.preventDefault();

        // Collect form data
        const accountID = document.getElementById("account-id").value;
        const pointString = document.getElementById("point").value;
        const firstName = document.getElementById("first-name").value;
        const middleName = document.getElementById("middle-name").value;
        const lastName = document.getElementById("last-name").value;
        const dob = document.getElementById("dob").value;
        const gender = document.getElementById("gender").value;
        const address = document.getElementById("address").value;
        const phoneNumber = document.getElementById("phone-number").value;
        // Send form data to the backend
        console.log(dob);
        const point = parseInt(pointString);

        AddNewCustomer(
          accountID,
          point,
          firstName,
          middleName,
          lastName,
          dob,
          gender,
          address,
          phoneNumber
        );
        // const response = await fetch('/link_ve_BE', {
        //     method: 'POST',
        //     headers: {
        //     'Content-Type': 'application/json'
        //     },
        //     body: JSON.stringify({
        //     accountID,
        //     point,
        //     firstName,
        //     middleName,
        //     lastName,
        //     dob,
        //     gender,
        //     address
        //     })
        // })
        // .then(response => response.json())
        // .then(data => {
        //     if (data.success) {
        //     alert('Customer inserted successfully');
        //     } else {
        //     alert('Error inserting customer with BE response.');
        //     }
        // })
        // .catch(error => {
        //     console.error('Error:', error);
        //     alert('Error inserting customer');
        // });

        // Check for duplicate ID
        const tableBody = document.getElementById("customer-table-body");
        const rows = tableBody.getElementsByTagName("tr");
        for (let row of rows) {
          const cells = row.getElementsByTagName("td");
          if (cells[0].textContent === accountId) {
            alert("Duplicate information");
            return;
          }
        }

        // Create a new row in the customer table
        const newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${accountId}</td>
            <td>${point}</td>
            <td>${firstName}${middleName}${lastName}</td>
            <td>${dob}</td>
            <td>${gender}</td>
            <td>${address}</td>
        `;
        tableBody.appendChild(newRow);

        // Close the modal after submission
        modal.style.display = "none";
      });
  });
