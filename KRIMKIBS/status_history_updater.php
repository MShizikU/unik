<?php

require("curl_requester.php");
require("amo_response_decomposer.php");
require("db_operations.php");

date_default_timezone_set('Europe/Moscow');

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "a");
fwrite($log_file, "\nSTATUS HISTORY UPDATER\n");

$headers = [
    'Authorization: Bearer ' . $access_token
];

$hostDB = "krymkibs.beget.tech";
$usernameDB = "krymkibs_crm";
$passwordDB = "CQi%*6o&";
$nameDB = "krymkibs_crm";

$database = mysqli_connect($hostDB, $usernameDB, $passwordDB, $nameDB);

if ($database == false){
    fwrite($log_file, "\nDatabase error: " . mysqli_connect_error());
}

mysqli_set_charset($database, "utf8");

$lead = $_POST['leads']['status'][0];


$data = array(
    "responsible_user_id" => $lead["responsible_user_id"],
    "created_user_id" => $lead["created_user_id"],
    "created_date" => ($lead["date_create"] != null) ? DateTime::createFromFormat('U', $lead["date_create"])->format('Y-m-d H:i:s') : null,
    "updated_date" => ($lead["last_modified"] != null) ? DateTime::createFromFormat('U', $lead["last_modified"])->format('Y-m-d H:i:s') : null,
    "account_id" => $lead["account_id"],
    "status_new" => $lead["status_id"],
    "status_old" => $lead["old_status_id"],
    "pipeline_id_new" => $lead["pipeline_id"],
    "lead_id" => $lead["id"]
);

$getOldPipelineIdSQL = "SELECT pipeline_id FROM status WHERE id = " . $lead["old_status_id"];

$getOldPipelineId = mysqli_query($database, $getOldPipelineIdSQL);

if ($getOldPipelineId){
    $row = mysqli_fetch_assoc($getOldPipelineId);
    $data["pipeline_id_old"] = $row["pipeline_id"];

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

    $insertIntoDbSQL = "INSERT INTO status_history (`" . implode("`, `", array_keys($data)) . "`) VALUES (" . $values . ")";
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
    fwrite($log_file, "\n Database error: " . $database->error);
}

