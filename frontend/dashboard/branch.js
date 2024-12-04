document.getElementById('branch-menu').addEventListener('click', function() {
    document.getElementById('scrollingtable1').style.display = 'none';
    document.getElementById('scrollingtable2').style.display = 'none';
    document.getElementById('scrollingtable3').style.display = 'none';
    document.getElementById('scrollingtable4').style.display = 'block';
    document.getElementById('breadcrumb-database').style.display = 'inline';
    document.getElementById('breadcrumb-branch').style.display = 'inline';
    document.getElementById('breadcrumb-device').style.display = 'none';
    document.getElementById('breadcrumb-customer').style.display = 'none';
});