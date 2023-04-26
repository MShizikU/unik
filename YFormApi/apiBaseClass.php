<?php
class apiBaseClass {
    
    public $mySQLWorker=null;

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