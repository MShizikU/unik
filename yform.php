<?php

header("Access-Control-Allow-Origin: *");

$data = file_get_contents("php://input");

if ($data === null){
    $data = $_POST[0];
}

// Make sure the data was successfully decoded


http_response_code(200);
echo $data;
?>
