<?php
function execSaveInBd($table_name, $data, $log_file, $database){
        $checkIfExistSQL = 'SELECT id FROM ' . $table_name .' WHERE id = ' . $data["id"];
        $checkIfExistRequest = mysqli_query($database, $checkIfExistSQL);
    
        if (mysqli_num_rows($checkIfExistRequest) == 0)
        {

            $values = "";

            foreach(array_values($data) as $key => $value){
                if ($value == null){
                    $values = $values . "NULL, ";
                } 
                else{
                    $values = $values . "'" . $value . "', ";
                }
            }

            $values = substr($values, 0, strlen($values) - 2);

            $insertIntoDbSQL = "INSERT INTO " . $table_name ." (`" . implode("`, `", array_keys($data)) . "`) VALUES (" . $values . ")";
            //fwrite($log_file, "\nRequest: " . $insertIntoDbSQL );
    
            if (mysqli_query($database, $insertIntoDbSQL))
            {
                //fwrite($log_file, "\nRecord insert successfully" . $database->error);
            }
            else
            {
                fwrite($log_file, "\nRequest: " . $insertIntoDbSQL );
                fwrite($log_file, "\nDatabase insert error" . $database->error);
            }
        }
        else
        {
            if (array_key_exists('updated_at', $data)){
                if ($data['updated_at'] !== null){
                    $currentDate = (new DateTime())->setTime(0, 0, 0);
                    $updatedAt = (new DateTime($data['updated_at']))->setTime(0, 0, 0);
                    if ($currentDate->diff($updatedAt) == 0){
                        return ;
                    }
                }
            }
            
            $setedInfo = "";
            foreach($data as $key => $info){
                if ($info != null && $key != 'id'){
                    $setedInfo = $setedInfo . "" . $key . " = '" . $info . "', ";
                }
            }

            $setedInfo = substr($setedInfo, 0, strlen($setedInfo) - 2);
    
            $updateDbSQL = "UPDATE " . $table_name . " SET " . $setedInfo . " WHERE id = '{$data['id']}'";
            //fwrite($log_file, "\nRequest: " . $updateDbSQL );
    
            if ($database->query($updateDbSQL)) 
            {
                //fwrite($log_file, "\nRecord update successfully" . $database->error);
            }
            else
            {
                fwrite($log_file, "\nRequest: " . $updateDbSQL );
                fwrite($log_file, "\nDatabase update error" . $database->error);
            }
        }
    }