<?php
class apiBaseClass {
    
    public $mySQLWorker=null;

    function __construct($dbName=null,$dbHost=null,$dbUser=null,$dbPassword=null) {
        if (isset($dbName)){
            $this->mySQLWorker = MySQLiWorker::getInstance($dbName,$dbHost,$dbUser,$dbPassword);
        }
    }
    
    function __destruct() {
        if (isset($this->mySQLWorker)){ 
            $this->mySQLWorker->closeConnection();  
        }
    }
    function createDefaultJson() {
        $retObject = json_decode('{}');
        return $retObject;
    }
    
    function fillJSON(&$jsonObject, &$stmt, &$mySQLWorker) {
        $row = array();
        $mySQLWorker->stmt_bind_assoc($stmt, $row);
        while ($stmt->fetch()) {
            foreach ($row as $key => $value) {
                $key = strtolower($key);
                $jsonObject->$key = $value;
            }
            break;
        }
        return $jsonObject;
    }
}

?>