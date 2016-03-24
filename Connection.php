<?php

/**
 * Created by PhpStorm.
 * User: janko
 * Date: 23. 03. 2016
 * Time: 16:42
 */
class Connection
{
    private $servername = "localhost";
    private $username = "vnesi svoje uporabniško ime";
    private $password = "vnesi svoje geslo";
    private $database = "vnesi ime baze";
    private $connection;

    public function __construct()
    {
        $this->connection = new PDO("mysql:host=$this->servername;dbname=$this->database", $this->username, $this->password);
        $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public function query($tablename)
    {
        return $this->connection->query("SELECT * FROM $tablename");
    }
    
    public function orderedQuery($tablename,$field, $value,$orderField)
    {
        return $this->connection->query("SELECT * FROM $tablename WHERE $field = $value ORDER BY $orderField DESC");
    }

    public function insert($tableName, $parm)
    {
         $statement = $this->connection->prepare("INSERT INTO $tableName VALUES(:param))");
         $statement->execute([':tablename' => $tableName, ':param' => $parm]);
    }

    public function innerJoin($table1, $table2, $param1, $param2)
    {
        return $this->connection->query("SELECT * FROM $table1 INNER JOIN $table2 ON $table1.$param1 = $table2.$param2");
    }
    // specialno za zbirno prodajo po mesecih

    public function queryMonthlyData($dateField, $sumFielad,$tableName, $whereFielad, $whereValue)
    {
        return $this->connection->query("SELECT MONTH($dateField) AS 'month', SUM($sumFielad) AS 'month_total'FROM $tableName WHERE $whereFielad = $whereValue GROUP BY MONTH($dateField)");
    }
    
    public function getDataWithTotal($sumFielad, $tablename, $whereField, $whereValue)
    {
        return $this->connection->query("SELECT SUM($sumFielad) AS 'total' FROM $tablename WHERE $whereField = $whereValue");
    }

}