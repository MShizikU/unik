<?php

require("curl_requester.php");
require("amo_response_decomposer.php");

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "w");

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
        $checker = false;
    }
}

foreach($usersData as $key => $user) {
    $userID = $user->id;
    $userName = $user->name;
    $userGroupID = $user->rights->group_id;
    fwrite($log_file, "\n" . $key . " " . $userID . ": " . $userName . ' ' . $userGroupID);
}

fclose($log_file);