<?php

require("curl_requester.php");
require("amo_response_decomposer.php");

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "w");

$headers = [
    'Authorization: Bearer ' . $access_token
];

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
        $checker = false;
    }
}



foreach($contactsData as $key => $contact) {
    $contactID = $contact->id;
    $contactName = $contact->name;
    $contactRespUserID = $contact->responsible_user_id;
    $contactCreatedBy = $contact->created_by;
    $contactUpdatedBy = $contact->updated_by;
    $contactCreatedAt = $contact->created_at;
    $contactUpdatedAt = $contact->updated_at;
    $contactAccountId = $contact->account_id;

    $customFields = [588563, 619223, 677493, 677495, 588565, 588567 ];

    $customFieldsValues = getCustomFieldValues($contact, $customFields);

    fwrite($log_file, "\n" . $key . ":" . $contactID . "\n" . print_r($customFieldsValues, true). "\n");

    //Dolghnosty = 588563
    //dob = 619223
    //full_years = 677493
    //full_months = 677495
    //Telefon = 588565
    //Email = 588567
}

fclose($log_file);