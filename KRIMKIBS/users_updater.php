<?php

require("curl_requester.php");
require("amo_response_decomposer.php");
require("db_operations.php");

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "a");
fwrite($log_file, "\nUSERS UPDATER\n");

$hostDB = "krymkibs.beget.tech";
$usernameDB = "krymkibs_crm";
$passwordDB = "CQi%*6o&";
$nameDB = "krymkibs_crm";

$database = mysqli_connect($hostDB, $usernameDB, $passwordDB, $nameDB);

if ($database == false){
    fwrite($log_file, "\nDatabase error: " . mysqli_connect_error());
}

mysqli_set_charset($database, "utf8");

$headers = [
    'Authorization: Bearer ' . $access_token
];

$usersData = [];

$checker = true;
$pageCounter = 1;

while($checker){
    $getUsersRequestResult = execCURLRequest('https://'. $amo_domain . '/api/v4/users?limit=250&page=' . $pageCounter, $headers, null, "GET");
    $usersResponse = $getUsersRequestResult['response'];
    $usersCode = $getUsersRequestResult['code'];

    //fwrite($log_file,  "Get users response: \n" . $usersResponse . "\n");
    //fwrite($log_file,  "Get users code: \n" . $usersCode . "\n");

    if ($usersCode >= 200 && $usersCode <= 204) {
        $responseData = json_decode($usersResponse);
        $usersData = array_merge($responseData->_embedded->users);
        $nextPage = $responseData->_links->next;
        $checker = ($nextPage != null);
        $pageCounter = $pageCounter + 1;
    }else{
        fwrite($log_file, "\nError: " .  $usersCode . " " . $usersResponse);
        $checker = false;
    }
}

foreach($usersData as $key => $user) {
    $data = array(
        "id" => $user->id,
        "name" => $user->name,
        "group_id" => $user->rights->group_id
    );

    execSaveInBd("users" ,$data, $log_file, $database, array("id"));

}
$database->close();
fclose($log_file);