<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap linki -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- javascript in jquery -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/redmond/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <!-- moj css -->
    <link rel="stylesheet" type="text/css" href="/trgovina/theme.css">
    
    <title>PDO TEST</title>
    
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="page-header">
                <h2> Naši Prodajalci </h2>
            </div>
            <table class="table responsive table-bordered">
                <thead>
                    <tr class="glava">
                        <th>Ime in Priimek</th>
                        <th>E-mail</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                include 'SaleController.php';

                $controller = new SaleController();
                $controller-> showAllVendors();
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<