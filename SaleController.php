<?php
include 'Vendor.php';
include 'VendorView.php';
/**
 * Created by PhpStorm.
 * User: janko
 * Date: 23. 03. 2016
 * Time: 17:59
 */
class SaleController
{

    /**
     * SaleController constructor.
     */
    public function __construct()
    {
    }

    public function showAllVendors()
    {
        $vendor = new Vendor();
        $vendors = $vendor->getAll();
        
        $view = new VendorView();
        $view->renderVendors($vendors);
    }

    public function vendorDetails($vendorId)
    {
        $vendor = new Vendor();
        $vendor = $vendor->getVendorDetalis($vendorId);
        
        $view = new VendorView();
        $view->renderVendorDetails($vendor);
        
    }

    public function vendorSales($vendorId)
    {
        $vendor = new Vendor();
        $sales = $vendor->getVendorSales($vendorId);

        $view = new VendorView();
        $view->renderVendorSales($sales);

    }

    public function vendorSalesMonthly($vendorId)
    {
        $vendor = new Vendor();
        $montlySales = $vendor->getVendoerMonthlySales($vendorId);
        
        $view = new VendorView();
        $view->renderVendorSalesMonthly($montlySales);
    }

    public function totalVendorSale($vendorId)
    {
        $vendor = new Vendor();
        $vendorTotalSale = $vendor->getVendorTotalSale($vendorId);
        
        $view = new VendorView();
        $view->renderVendorTotal($vendorTotalSale);
    }
}