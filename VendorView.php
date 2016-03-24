<?php
include 'Connection.php';
/**
 * Created by PhpStorm.
 * User: janko
 * Date: 23. 03. 2016
 * Time: 18:05
 */
class VendorView
{

    public function __construct()
    {
    }

    public function renderVendors($vendors)
    {
        foreach ($vendors as $vendor)
        {
            echo "<tr >".
                // don't be scared a bit messy string concatination point is tod add post_id to the url
                "<td>"."<a href=".'/trgovina/vendor_sales.php?id='.$vendor["id"].'>'.$vendor['name']." ".$vendor['surname']."</a>".
                "</td>".
                "<td>".$vendor['email']."</td>".
                "</tr>";
        }
    }

    public function renderVendorDetails($vendor)
    {
        echo '<p> <span class="krepko">Ime in Priimek</span> '. $vendor['name']. ' '. $vendor['surname'].'</p>'.
            '<p> <span class="krepko">E-mail</span> '. $vendor['email'].'</p>'.
            '<p> <span class="krepko">Telefon</span> '. $vendor['phone'].'</p>';
    }

    public function renderVendorSales($sales)
    {
        foreach ($sales as $sale)
        {
            echo '<tr>'.
                '<td>'.$sale['date'].'</td>'.
                '<td>'.$sale['customer'].'</td>'.
                '<td>'.$sale['total'].'</td>'.
                '</tr>';

        }
    }
    // prikaz podatkov v modal
    public function renderVendorSalesMonthly($montlySales)
    {
        foreach ($montlySales as $montlySale)
        {
            echo '<tr>'.
                '<td>'.$montlySale['month'].'</td>'.
                '<td>'.$montlySale['month_total'].'</td>'.
                '</tr>';
        }
    }

    public function renderVendorTotal($vendorTotalSale)
    {
        echo '<p>'.$vendorTotalSale.' EUR'.'</p>';
    }
}