<?php

class Database 
{
    private $dbHost = DB_HOST;
    private $dbUser = DB_USER;
    private $dbPass = DB_PASS;
    private $dbName = DB_NAME;
    private $dbHandler;
    private $statement; 

    public function __construct()
    {
        //verbinding met de database
        $conn = 'mysql:host=' . $this->dbHost . ';dbname=' .  $this->dbName . ';charset=UTF8';

        try {
            $this->dbHandler = new PDO($conn, $this->dbUser, $this->dbPass);
            // echo 'Er is verbinding met de sql server';
        } catch(PDOException $e) {
            echo $e->getMessage();
        }
    }

    public function query($sql)
    {
        $this->statement = $this->dbHandler->prepare($sql);
    }
     public function execute()
    {
        return $this->statement->execute();
    }

    public function resultSet()
    {
        $this->execute();
        return $this->statement->fetchALL(PDO::FETCH_OBJ);
    }
}
