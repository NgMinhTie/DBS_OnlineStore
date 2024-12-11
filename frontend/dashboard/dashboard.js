document.addEventListener('DOMContentLoaded', function() {
    const dashboardMenu = document.getElementById('dashboard-menu');
    const branchMenu = document.getElementById('branch-menu');
    const databaseMenu = document.getElementById('database-menu');
    const deviceMenu = document.getElementById('device-menu');
    const customersMenu = document.getElementById('customers-menu');
    const settingsMenu = document.getElementById('settings-menu');
    const scrollingTable1 = document.getElementById('scrollingtable1');
    const scrollingTable2 = document.getElementById('scrollingtable2');
    const scrollingTable3 = document.getElementById('scrollingtable3');
    const scrollingTable4 = document.getElementById('scrollingtable4');
    const buttonContainers = document.querySelectorAll('.button-container');

    function hideAllTables() {
        scrollingTable1.style.display = 'none';
        scrollingTable2.style.display = 'none';
        scrollingTable3.style.display = 'none';
        scrollingTable4.style.display = 'none';
        buttonContainers.forEach(container => container.style.display = 'none');
    }

    dashboardMenu.addEventListener('click', function() {
        hideAllTables();
    });

    settingsMenu.addEventListener('click', function() {
        hideAllTables();
        scrollingTable3.style.display = 'block';
        document.querySelector('#scrollingtable3 + .button-container').style.display = 'flex';
    });

    branchMenu.addEventListener('click', function() {
        hideAllTables();
        scrollingTable4.style.display = 'block';
        //document.querySelector('#scrollingtable4 + .button-container').style.display = 'flex';
    });

    databaseMenu.addEventListener('click', function() {
        hideAllTables();
        
        scrollingTable1.style.display = 'block';
        scrollingTable4.style.display = 'block';
        scrollingTable2.style.display = 'block';
        scrollingTable3.style.display = 'block';
        
        buttonContainers.forEach(container => container.style.display = 'None');
    });

    deviceMenu.addEventListener('click', function() {
        hideAllTables();
        scrollingTable1.style.display = 'block';
        //document.querySelector('#scrollingtable1 + .button-container').style.display = 'flex';
        scrollingTable2.style.display = 'block';
        //document.querySelector('#scrollingtable2 + .button-container').style.display = 'flex';
    });

    customersMenu.addEventListener('click', function() {
        hideAllTables();
        scrollingTable3.style.display = 'block';
        //document.querySelector('#scrollingtable3 + .button-container').style.display = 'flex';
    });

    // Initialize by hiding all tables
    hideAllTables();
});
