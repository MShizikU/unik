<?php
$light_doc_token_auth = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiOTExNTMyIiwidXNlcl9hZ2VudCI6ImFnZW50IENocm9tZSBvbiBXaW5kb3dzIDEwIiwidXNlcl9pZCI6IjkxMTUxOCIsInNjb3BlIjoiIiwicmVmcmVzaF9leHBpcnkiOiIxOTk4ODEwMTg3IiwibmJmIjoxNjgzNDUwMTg3LCJleHAiOjE5OTg4MTAxODcsImlhdCI6MTY4MzQ1MDE4NywiaXNzIjoiaHR0cDovL2xpZ2h0ZG9jLmlvIiwiYXVkIjoibGlnaHRkb2NfY2xpZW50In0.Ba-OnGKs0qgL_EaKFmMpz0KZu5n2OK2Mb1iYlovt2z4";
$light_doc_domen = "api.demo.lightdoc.io";
$delimetr = "-------------0123456789";


$data = json_decode(file_get_contents('php://input'), true);

if ($data != null){

    $lead_id  = $data["leads"]["status"]["0"]["id"];

    $custom_fields = $data["leads"]["status"]["0"]["custom_fields"];

    $lead_doc_fio = "";
    $lead_contact_email = "";
    $lead_doc_date = "";
    $lead_doc_link = "";

    foreach ($custom_fields as $field) {
        if ($field["id"] == '627833'){
            if ($field["values"][0] == null){
                http_response_code(400);
                return "FIO in lead wasn't mentioned";
            }else{
                $lead_doc_fio = explode(" ", $field["values"][0]);
            }
        }
        else if ($field["id"] == '627855'){
            if ($field["values"][0] == null){
                http_response_code(400);
                return "Date in lead wasn't mentioned";
            }else{
                $lead_doc_date = $field["values"][0];
            }
        }
        else if ($field["id"] == '621947'){
            if ($field["values"][0] == null){
                http_response_code(400);
                return "Doc link in lead wasn't mentioned";
            }else{
                $lead_doc_link = $field["values"][0];
            }
        }
    }

    $light_doc_creation_payload = array(
        'id' => $lead_id,
        'name' => 'Договор '. $lead_id . ' от ' . $lead_doc_date . 'г с ' . $lead_doc_fio[0] . ' ' . substr($lead_doc_fio[1], 0, 1) . '.',
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
    
    $light_doc_creation_payload_json = json_encode($light_doc_creation_payload);
    
    $curl_light_doc_creation_req = curl_init();
    
    curl_setopt($curl_light_doc_creation_req, CURLOPT_URL, 'https://'. $light_doc_domen .'/v1/documents');
    curl_setopt($curl_light_doc_creation_req, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl_light_doc_creation_req, CURLOPT_POST, 1);
    curl_setopt($curl_light_doc_creation_req, CURLOPT_POSTFIELDS, $light_doc_creation_payload_json);
    curl_setopt($curl_light_doc_creation_req, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Authorization: Bearer ' . $light_doc_token_auth
    ));
    
    $light_doc_creation_response_json = curl_exec($curl_light_doc_creation_req);

    $light_doc_creation_response = json_decode($light_doc_creation_response_json);
    
    $http_code = curl_getinfo($curl_light_doc_creation_req, CURLINFO_HTTP_CODE);

    curl_close($curl_light_doc_creation_req);

    if ($http_code >= 200 && $http_code <= 226 ) {

        $light_doc_document_id = $light_doc_creation_response->documentID;

        $lead_doc_pdf = file_get_contents($lead_doc_link); 

        $local_file_path = 'filename.pdf';

        file_put_contents($local_file_path, $lead_doc_pdf);

        $pdf_data = curl_file_create($local_file_path, 'application/pdf', 'filename.pdf');

        $curl_light_doc_add_req = curl_init();
        
        curl_setopt($curl_light_doc_add_req, CURLOPT_URL, 'https://'. $light_doc_domen .'/v1/documents/' . $light_doc_document_id . '/files');
        curl_setopt($curl_light_doc_add_req, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl_light_doc_add_req, CURLOPT_POST, 1);
        curl_setopt($curl_light_doc_add_req, CURLOPT_POSTFIELDS, array(
            "files" => $pdf_data
        ));
        curl_setopt($curl_light_doc_add_req, CURLOPT_HTTPHEADER, array(
            'Content-Type: multipart/form-data',
            'Authorization: Bearer ' . $light_doc_token_auth
        ));

        $light_doc_add_req_response_json = curl_exec($curl_light_doc_add_req);

        $http_code_add = curl_getinfo($curl_light_doc_add_req, CURLINFO_HTTP_CODE);
        
        curl_close($curl_light_doc_add_req);

        http_response_code($http_code_add);

        echo $light_doc_add_req_response_json;

    } else {

        http_response_code($http_code);
        
        echo $light_doc_creation_response_json;
    }
}
else{
    http_response_code(400);
    echo "Wrong lead format";
}

?>