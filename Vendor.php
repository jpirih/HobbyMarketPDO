<?php

/**
 * Created by PhpStorm.
 * User: janko
 * Date: 23. 03. 2016
 * Time: 18:00
 */
class Vendor
{
    private $connection;

    public function __construct()
    {
        $this->connection = new Connection();
    }

    public function getAll()
    {
        return $this->connection->query('vendors');
    }

    public function getVendorDetalis($id)
    {
        $vendors = $this->connection->query('vendors');

        foreach ($vendors as $item) {
            if ($item['id'] == $id) {
                $id = $item['id'];
                $name = $item['name'];
                $surname = $item['surname'];
                $email = $item['email'];
                $phone = $item['phone'];

                $data = array('id' => $id, 'name' => $name, 'surname' => $surname, 'email' => $email, 'phone' => $phone);
                return $data;
            }


        }
    }

    public function getVendorSales($vendorId)
    {
        $sales = $this->connection->orderedQuery('sales', 'vendor_id', $vendorId, 'sale_date');
        $customers = $this->connection->query('customers');
        $allCustomers = [];
        foreach ($customers as $customer)
        {
           $customers = array('id' =>$customer['id'], 'name' => $customer['name'],'surname' =>$customer['surname']);
            array_push($allCustomers, $customers);

        }

        $allData = [];
        foreach ($sales as $sale)
        {
            foreach ($allCustomers as $customer)
            {
              
                if($sale['customer_id'] == $customer['id'])
                {
                    $customerName = $customer['name'].' '.$customer['surname'];
                    $data = array('id' => $sale['id'], 'date' => $sale['sale_date'],'customer' => $customerName, 'total' => $sale['sum_total']);


                }


            }




            array_push($allData, $data);
        }
        return $allData;


    }

    public function getVendoerMonthlySales($vendorId)
    {
        $allData = [];
        $salesByMonth = $this->connection->queryMonthlyData('sale_date','sum_total','sales','vendor_id', $vendorId);

        foreach ($salesByMonth as $month)
        {
            $data = array('month' => $month['month'], 'month_total' => $month['month_total']);
            array_push($allData, $data);
        }
        return $allData;
    }

    public function getVendorTotalSale($vendorId)
    {
        $vendorTotal = $this->connection->getDataWithTotal('sum_total', 'sales', 'vendor_id', $vendorId);
        foreach ($vendorTotal as $item)
        {
            return $item['total'];
        }
    }
}