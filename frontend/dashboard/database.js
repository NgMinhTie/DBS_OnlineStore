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
    const searchTerms = searchTerm.split(' ').filter(term => term.toLowerCase()); // Split and filter empty terms

    if (searchTerms.length === 0) {
        // If search term is empty, display all rows
        for (let row of rows) {
            row.style.display = '';
        }
        return;
    }

    let found = false;

    for (let row of rows) {
        const cells = row.getElementsByTagName('td');
        let match = searchTerms.some(term => {
            return Array.from(cells).some(cell => {
                const cellText = cell.textContent.toLowerCase();
                return cellText.includes(term) || (term === 'null' && cellText === 'null');
            });
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
    const searchTerm = document.getElementById('search-input').value.toLowerCase();
    searchTable(searchTerm, 'customer-table-body');
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
