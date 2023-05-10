<?php


function addNewDocToLightDoc($input){

    $light_doc_token_auth = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiOTExNTMyIiwidXNlcl9hZ2VudCI6ImFnZW50IENocm9tZSBvbiBXaW5kb3dzIDEwIiwidXNlcl9pZCI6IjkxMTUxOCIsInNjb3BlIjoiIiwicmVmcmVzaF9leHBpcnkiOiIxOTk4ODEwMTg3IiwibmJmIjoxNjgzNDUwMTg3LCJleHAiOjE5OTg4MTAxODcsImlhdCI6MTY4MzQ1MDE4NywiaXNzIjoiaHR0cDovL2xpZ2h0ZG9jLmlvIiwiYXVkIjoibGlnaHRkb2NfY2xpZW50In0.Ba-OnGKs0qgL_EaKFmMpz0KZu5n2OK2Mb1iYlovt2z4";
    $light_doc_domen = "api.demo.lightdoc.io";


    $data = json_decode($input);

    if ($data != null){

        $lead_id  = $data->leads->status->{0}->id;

        $custom_fields = $data->leads->status[0]->custom_fields;

        $lead_doc_fio = "";
        $lead_contact_email = "";
        $lead_doc_date = "";

        foreach ($custom_fields as $field) {
            if ($field->id == '627833'){
                if ($field->values[0] == null){
                    http_response_code(400);
                    return "FIO in lead wasn't mentioned";
                }else{
                    $lead_doc_fio = explode(" ", $field->values[0]);
                }
            }
            else if ($field->id == '627855'){
                if ($field->values[0] == null){
                    http_response_code(400);
                    return "FIO in lead wasn't mentioned";
                }else{
                    $lead_doc_date = $field->values[0];
                }
            }
        }

        $payload = array(
            'id' => $lead_id,
            'name' => 'Договор '. $lead_id . ' от ' . $lead_doc_date . 'г с ' . $lead_doc_fio[0] . substr($lead_doc_fio[1], 0, 1) . '.',
            'isSequential' => false,
            'signers' => array(
                array(
                    'firstName' => $lead_doc_fio[0],
                    'lastName' => $lead_doc_fio[1],
                    'patronymic' => $lead_doc_fio[2],
                    'email' => 'demo+petr@lightdoc.io',
                    'approveType' => "Bes"
                )
            )
        );
        
        $json_payload = json_encode($payload);

        echo $json_payload;
        
        $ch = curl_init();
        
        curl_setopt($ch, CURLOPT_URL, 'https://'. $light_doc_domen .'/v1/documents');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json_payload);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Authorization: Bearer ' . $light_doc_token_auth
        ));
        
        $response = curl_exec($ch);
        
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        curl_close($ch);

        if ($http_code >= 200 && $http_code <= 226) {
            http_response_code($http_code);
            return $response;

        } else {
            http_response_code($http_code);
            return $json_payload;
        }
    }
    else{
        http_response_code(400);
        return "Wrong lead format";
    }
}


echo addNewDocToLightDoc(file_get_contents("php://input"));

?>