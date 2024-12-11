document.getElementById('database-menu').addEventListener('click', function() {
    document.getElementById('scrollingtable1').style.display = 'block';
    document.getElementById('scrollingtable2').style.display = 'block';
    document.getElementById('scrollingtable3').style.display = 'block';
    document.getElementById('scrollingtable4').style.display = 'block';
    document.getElementById('breadcrumb-database').style.display = 'inline';
    document.getElementById('breadcrumb-branch').style.display = 'none';
    document.getElementById('breadcrumb-device').style.display = 'none';
    document.getElementById('breadcrumb-customer').style.display = 'none';
});

function searchTable(searchTerm, tableBodyId) {
    const tableBody = document.getElementById(tableBodyId);
    const rows = tableBody.getElementsByTagName('tr');
    const searchTerms = searchTerm.split(' ').filter(term => term); // Split and filter empty terms
    let found = false;

    for (let row of rows) {
        const cells = row.getElementsByTagName('td');
        let match = searchTerms.every(term => {
            return Array.from(cells).some(cell => cell.textContent.toLowerCase().includes(term));
        });

        if (match) {
            row.style.display = '';
            found = true;
        } else {
            row.style.display = 'none';
        }
    }

    if (!found) {
        alert('No information');
    }
}

document.getElementById('search-button').addEventListener('click', function() {
    const customerID = document.getElementById('search-input').value;
    fetchCustomerDetails(customerID);
});

document.getElementById('search-button-table1').addEventListener('click', function() {
    const searchTerm = document.getElementById('search-input-table1').value.toLowerCase();
    searchTable(searchTerm, 'table1-body');
});

document.getElementById('search-button-table2').addEventListener('click', function() {
    const searchTerm = document.getElementById('search-input-table2').value.toLowerCase();
    searchTable(searchTerm, 'table2-body');
});

document.getElementById('search-button-table4').addEventListener('click', function() {
    const searchTerm = document.getElementById('search-input-table4').value.toLowerCase();
    searchTable(searchTerm, 'table4-body');
});

async function fetchCustomerData() {
    try {
        const response = await fetch('http://localhost:5501/getCustomerList', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            },
        });
        const data = await response.json();
        console.log('Data received from server:', response.json()); // Thêm dòng này để kiểm tra dữ liệu nhận được
        populateCustomerTable(data);
    } catch (error) {
        console.error('Error fetching customer data:', error);
    }
}

function populateCustomerTable(customers) {
    const tableBody = document.getElementById('customer-table-body');
    tableBody.innerHTML = ''; // Clear existing content

    customers.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.AccountID}</td>
            <td>${customer.FName} ${customer.MName} ${customer.LName}</td>
            <td>${customer.Address}</td>
            <td>${customer.PhoneNumber}</td>
            <td>${customer.CusPoint}</td>
        `;
        tableBody.appendChild(row);
    });
}

async function fetchCustomerDetails(customerID) {
    try {
        const response = await fetch('https://your-server-endpoint/notknown1', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ customerID })
        });
        const data = await response.json();
        console.log('Data received from server:', data); // Thêm dòng này để kiểm tra dữ liệu nhận được
        populateCustomerDetails(data.result);
    } catch (error) {
        console.error('Error fetching customer details:', error);
    }
}

function populateCustomerDetails(data) {
    const tableBody = document.getElementById('customer-table-body');
    tableBody.innerHTML = ''; // Clear existing content

    if (data.length === 0 || data[0].length === 0) {
        console.error('No customer details found');
        return;
    }

    const customerDetails = data[0][0];
    const phoneNumber = data[1][0]?.PhoneNumber || 'N/A'; // Kiểm tra nếu không có số điện thoại

    const row = document.createElement('tr');
    row.innerHTML = `
        <td>${customerDetails.AccountID}</td>
        <td>${customerDetails.FName} ${customerDetails.MName} ${customerDetails.LName}</td>
        <td>${customerDetails.Address}</td>
        <td>${phoneNumber}</td>
        <td>${customerDetails.CusPoint}</td>
    `;
    tableBody.appendChild(row);
}

async function fetchTable1Data() {
    try {
        const response = await fetch('https://your-server-endpoint/table1');
        const data = await response.json();
        populateTable1(data);
    } catch (error) {
        console.error('Error fetching table1 data:', error);
    }
}

function populateTable1(data) {
    const tableBody = document.getElementById('table1-body');
    tableBody.innerHTML = ''; // Clear existing content

    data.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.deviceId}</td>
            <td>${item.deviceName}</td>
            <td>${item.totalSales}</td>
            <td>${item.price}</td>
        `;
        tableBody.appendChild(row);
    });
}

async function fetchTable2Data() {
    try {
        const response = await fetch('https://your-server-endpoint/table2');
        const data = await response.json();
        populateTable2(data);
    } catch (error) {
        console.error('Error fetching table2 data:', error);
    }
}

function populateTable2(data) {
    const tableBody = document.getElementById('table2-body');
    tableBody.innerHTML = ''; // Clear existing content

    data.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.deviceName}</td>
            <td>${item.deviceBranch}</td>
            <td>${item.quantity}</td>
            <td>${item.price}</td>
        `;
        tableBody.appendChild(row);
    });
}

async function fetchTable4Data() {
    try {
        const response = await fetch('https://your-server-endpoint/table4');
        const data = await response.json();
        populateTable4(data);
    } catch (error) {
        console.error('Error fetching table4 data:', error);
    }
}

function populateTable4(data) {
    const tableBody = document.getElementById('table4-body');
    tableBody.innerHTML = ''; // Clear existing content

    data.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.branchId}</td>
            <td>${item.branchName}</td>
            <td>${item.branchLocation}</td>
            <td>${item.branchDiscountType}</td>
        `;
        tableBody.appendChild(row);
    });
}

async function fetchCustomerList() {
    try {
        const response = await fetch('http://localhost:100/getCustomerList',{
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
            //body: JSON.stringify({ customerID })
        });
        const data = await response.json();
        console.log("DEBUG", data);
        populateCustomerTable(data);
    } catch (error) {
        console.error('Error fetching customer list:', error);
    }
}

// Call the functions to fetch and populate data when the page loads
document.addEventListener('DOMContentLoaded', () => {
    fetchCustomerData();
    fetchTable1Data();
    fetchTable2Data();
    fetchTable4Data();
    fetchCustomerList();
});
