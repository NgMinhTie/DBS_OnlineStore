
document.getElementById('device-menu').addEventListener('click', function() {
    document.getElementById('scrollingtable1').style.display = 'block';
    document.getElementById('scrollingtable2').style.display = 'block';
    document.getElementById('scrollingtable3').style.display = 'none';
    document.getElementById('scrollingtable4').style.display = 'none';
    document.getElementById('breadcrumb-database').style.display = 'inline';
    document.getElementById('breadcrumb-branch').style.display = 'none';
    document.getElementById('breadcrumb-device').style.display = 'inline';
    document.getElementById('breadcrumb-customer').style.display = 'none';
});