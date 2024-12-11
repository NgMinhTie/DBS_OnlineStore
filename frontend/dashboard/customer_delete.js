
document.getElementById('delete-button-table3').addEventListener('click', function() {
    // Check if the modal already exists
    if (document.getElementById('customer-delete-modal')) {
        document.getElementById('customer-delete-modal').style.display = 'block';
        return;
    }

    // Create the modal
    const modal = document.createElement('div');
    modal.id = 'customer-delete-modal';
    modal.className = 'modal';
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close">&times;</span>
            <form id="customer-delete-form" class="insert-form">
                <label for="delete-account-id">Account ID:</label>
                <input type="text" id="delete-account-id" name="account-id" required><br>
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

    // Handle form submission
    document.getElementById('customer-delete-form').addEventListener('submit', function(event) {
        event.preventDefault();

        // Collect form data
        const accountId = document.getElementById('delete-account-id').value;

        // Check for existing ID and delete
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

        // Close the modal after deletion
        modal.style.display = 'none';
    });
});