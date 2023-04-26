<?php

class apiyandexform extends apiBaseClass{

    

    function sendInfoToAMOCrm($apiMethodParams) {
        $retJSON = $this->createDefaultJson();
        
            $userName = $apiMethodParams->UserFormName;
            $userNumber = $apiMethodParams->UserFormNumber;
            $userEmail = $apiMethodParams->UserFormEmail;
            $UserComment = $apiMethodParams->UserFormComment;

            $access_token_file_name = "access_token.txt";
            $domain = "vienna.amocrm.ru";

            $file = fopen($access_token_file_name, "r");

            $access_token = fread($file, filesize($access_token_file_name));

            $headers = [
                'Authorization: Bearer ' . $access_token,
                'Content-Type: application/json'
            ];
            $contactCreationData =  [[
                "name" => $userName,
                "custom_fields_values" => [
                        [
                         "field_id" => 64237, 
                         "values" => [
                                [
                                    "value" => $userNumber 
                                ] 
                            ] 
                        ],
                        [
                            "field_id" => 64239, 
                            "values" => [
                               [
                                  "value" => $userEmail 
                               ] 
                            ] 
                        ]
                   ] 
             ]]; 

            $contactCreationRequest = curl_init('https://'. $domain . '/api/v4/contacts');
            
            curl_setopt($contactCreationRequest, CURLOPT_POST, true);
            curl_setopt($contactCreationRequest,CURLOPT_RETURNTRANSFER, true);
            curl_setopt($contactCreationRequest, CURLOPT_POSTFIELDS, json_encode($contactCreationData));
            curl_setopt($contactCreationRequest,CURLOPT_USERAGENT,'amoCRM-oAuth-client/1.0');
            curl_setopt($contactCreationRequest,CURLOPT_HTTPHEADER, $headers);
            curl_setopt($contactCreationRequest,CURLOPT_HEADER, false);
            curl_setopt($contactCreationRequest,CURLOPT_SSL_VERIFYPEER, 1);
            curl_setopt($contactCreationRequest,CURLOPT_SSL_VERIFYHOST, 2);
            $resContactCreation = curl_exec($contactCreationRequest);

            $code = curl_getinfo($contactCreationRequest, CURLINFO_HTTP_CODE);
            curl_close($contactCreationRequest);

            $code = (int)$code;
            $errors = [
                400 => 'Bad request',
                401 => 'Unauthorized',
                403 => 'Forbidden',
                404 => 'Not found',
                500 => 'Internal server error',
                502 => 'Bad gateway',
                503 => 'Service unavailable',
            ];
            
            $retJSON->resultContact = $resContactCreation;

            try{
                if ($code == "" || $code < 200 || $code > 204) {
                    throw new Exception(isset($errors[$code]) ? $errors[$code] : 'Undefined error', $code);
                }
                else{
                    $contactCreatedID = ((json_decode($resContactCreation))->_embedded->contacts)[0]->id;
                    $leadCreationData = [[
                        'name'=> "{$userName}/заявка с яндекс бизнес/{$userNumber}",
                        "custom_fields_values" => [
                            [
                             "field_id" => 604587, 
                             "values" => [
                                    [
                                        "enum_id" => 322925
                                    ] 
                                ] 
                            ],
                            [
                                "field_id" => 628873, 
                                "values" => [
                                   [
                                      "value" => $UserComment
                                   ] 
                                ] 
                            ]
                        ],
                        "_embedded" => [
                            "contacts" =>[
                                    [
                                    "id" => $contactCreatedID
                                    ]
                                ]
                            ]
                    ]];
                    $leadCreationRequest= curl_init('https://'. $domain . '/api/v4/leads');
            
                    curl_setopt($leadCreationRequest, CURLOPT_POST, true);
                    curl_setopt($leadCreationRequest,CURLOPT_RETURNTRANSFER, true);
                    curl_setopt($leadCreationRequest, CURLOPT_POSTFIELDS, json_encode($leadCreationData));
                    curl_setopt($leadCreationRequest,CURLOPT_USERAGENT,'amoCRM-oAuth-client/1.0');
                    curl_setopt($leadCreationRequest,CURLOPT_HTTPHEADER, $headers);
                    curl_setopt($leadCreationRequest,CURLOPT_HEADER, false);
                    curl_setopt($leadCreationRequest,CURLOPT_SSL_VERIFYPEER, 1);
                    curl_setopt($leadCreationRequest,CURLOPT_SSL_VERIFYHOST, 2);
                    $resLeadCreation = curl_exec($leadCreationRequest);	
                    $retJSON-> resultLead = json_decode($resLeadCreation);
                }
            } catch(Exception $e)
            {
                    die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
            }
            
           
        return $retJSON;
    }
}
?>
