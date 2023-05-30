<?php

require("curl_requester.php");
require("amo_response_decomposer.php");
require("db_operations.php");

date_default_timezone_set('Europe/Moscow');

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "a");
fwrite($log_file, "\nCONTACTS UPDATER\n");

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

$contactsData = [];

$checker = true;
$pageCounter = 1;

while($checker){
    $getContactsRequestResult = execCURLRequest('https://'. $amo_domain . '/api/v4/contacts?limit=250&page=' . $pageCounter, $headers, null, "GET");
    $contactsResponse = $getContactsRequestResult['response'];
    $contactsCode = $getContactsRequestResult['code'];


    //fwrite($log_file,  "Get contacts response: \n" . $contactsResponse . "\n");
    //fwrite($log_file,  "Get contacts code: \n" . $contactsCode . "\n");

    if ($contactsCode >= 200 && $contactsCode <= 204) {
        $responseData = json_decode($contactsResponse);
        $contactsData = array_merge($responseData->_embedded->contacts);
        $nextPage = $responseData->_links->next;
        $checker = ($nextPage != null);
        $pageCounter = $pageCounter + 1;
    }else{
        fwrite($log_file, "\nError: " .  $contactsCode . " " . $contactsResponse);
        $checker = false;
    }
}



foreach($contactsData as $key => $contact) {

    $customFields = [588563, 619223, 677493, 677495, 588565, 588567 ];

    $customFieldsValues = getCustomFieldValues($contact, $customFields);

    //fwrite($log_file, "\n" . $key . ":" . $contactID . "\n" . print_r($customFieldsValues, true). "\n");

    $data = array(
        "id" => $contact->id,
        "name" => $contact->name,
        "responsible_user_id" => $contact->responsible_user_id,
        "created_by" => $contact->created_by,
        "updated_by" => $contact->updated_by,
        "created_at" => ($contact->created_at != null) ?DateTime::createFromFormat('U',$contact->created_at)->format('Y-m-d H:i:s') : null,
        "updated_at" => ($contact->updated_at != null) ? DateTime::createFromFormat('U',$contact->updated_at)->format('Y-m-d H:i:s') : null,
        "account_id" => $contact->account_id,
        "Dolghnosty" => $customFieldValues[588563],
        "dob" => ($customFieldValues[619223] != null) ? date('Y-m-d',$customFieldValues[619223]) : null,
        "full_years" => $customFieldValues[677493],
        "full_months" => $customFieldValues[677495],
        "Telefon" => $customFieldValues[588565],
        "Email" => $customFieldValues[588567]
    );

    execSaveInBd("contacts", $data, $log_file, $database, array("id"));
}
$database->close();
fclose($log_file);