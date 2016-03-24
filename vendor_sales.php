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

    <!-- jquery cdn -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/redmond/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <!-- moj css -->
    <link rel="stylesheet" type="text/css" href="/trgovina/theme.css">
    <title>Prodaja za prodajalca</title>
</head>
<body>
<div class="container">
    <div class="row col-sm-6 col-sm-offset-3">
        <div class="page-header">
            <h2>Prodaja prodajalca - podrobno </h2>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <div class="panel panel-primary">
                <div class="panel-body bg-info">
                    <?php
                    include 'SaleController.php';
                    $vendorId = $_GET['id'];

                    $controller = new SaleController();
                    $controller->vendorDetails($vendorId);

                    ?>
                    <br>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary " data-toggle="modal" data-target="#myModal">
                        Vrednost prodaje Skupaj
                    </button>


                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="page-header">
                <h2>Prodaja skupaj po mesecih </h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr class="glava">
                        <th>Mesec</th>
                        <th>Vrednost prodaje mesečno €</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $controller->vendorSalesMonthly($vendorId)
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="page-header">
                <h2>Zbirnik vseh Prodaj</h2>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <table class="table table-responsive table-bordered table-striped">
                <thead>
                    <tr class="glava">
                        <th>Datum</th>
                        <th>Kupec</th>
                        <th>Vrednost prodaje</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $controller->vendorSales($vendorId)
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Vrednost Prodaje Skupaj Letno </h4>
            </div>
            <div class="modal-body">
                <span class="krepko">Skupna vrednost prodaje tega prodajalca znaša:</span>
                <?php
                $controller->totalVendorSale($vendorId)
                ?>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Zapri</button>

            </div>
        </div>
    </div>
</div>
</body>
</html>

