<?php

    require("curl_requester.php");
    require("amo_response_decomposer.php");

    $amo_domain = "okenglish.amocrm.ru";

    $access_token = file_get_contents('access_token.txt');

    $log_file = fopen("log.txt", "w");

    $headers = [
        'Authorization: Bearer ' . $access_token
    ];

    $leadsData = [];

    $checker = true;
    $pageCounter = 1;

    while($checker){
        $getLeadsRequestResult = execCURLRequest('https://'. $amo_domain . '/api/v4/leads?with=contacts&limit=250&page=' . $pageCounter, $headers, null, "GET");
        $leadsResponse = $getLeadsRequestResult['response'];
        $leadsCode = $getLeadsRequestResult['code'];

        //fwrite($log_file,  "Get leads response: \n" . $leadsResponse . "\n");
        //fwrite($log_file,  "Get leads code: \n" . $leadsCode . "\n");

        if ($leadsCode >= 200 && $leadsCode <= 204) {
            $responseData = json_decode($leadsResponse);
            $leadsData = array_merge($responseData->_embedded->leads);
            $nextPage = $responseData->_links->next;
            $checker = ($nextPage != null);
            $pageCounter = $pageCounter + 1;
        }else{
            $checker = false;
        }
    }


    foreach($leadsData as $key => $lead) {
        $leadID = $lead->id;
        $leadName = $lead->name;
        $leadPrice = $lead->price;
        $leadRespUserID = $lead->responsible_user_id;
        $leadStatusID = $lead->status_id;
        $leadPipelineID = $lead->pipeline_id;
        $leadCreatedBy = $lead->created_by;
        $leadUpdatedBy = $lead->updated_by;
        $leadClosedAt = $lead->closed_at;
        $leadCreatedAt = $lead->created_at;
        $leadUpdatedAt = $lead->updated_at;
        $leadAccountId = $lead->account_id;
        $leadContactID = $lead->_embedded->contacts[0]->id;
        $customFields = [609943, 609949, 609953, 609961, 609963, 609981, 609985, 637083, 637085, 637087, 637089, 637091, 637093, 637095, 637097, 637099, 637165, 637167, 642557, 645691, 646135, 646183, 646185, 670969, 675058, 609995, 679445, 679611 ];
        $customFieldValues = getCustomFieldValues($lead, $customFields);
        fwrite($log_file, "\n" . $key . ":" . $leadContactID . "\n" . print_r($customFieldValues, true). "\n");
        //FIO_obuchaemogo = 609943
        //Kakaya_obrazovatelynaya_programma = 609949
        //Cely_obucheniya = 609953
        //Otkuda_uznali_o_nas = 609961
        //Filial_dlya_posescheniya = 609963
        //Prichina_otkaza = 609981
        //Otkaz_podrobno = 609985
        //Beseda_sb = 637083
        //Podbor_vremeni_sb = 637085
        //Zapisalsya_na_probnoe_sb = 637087
        //Ne_proshel_probnoe_sb = 637089
        //Dumaet_posle_probnogo_sb = 637091
        //Podbor_raspisaniya_sb = 637093
        //Oghidaem_oplatu_sb = 637095
        //Uspeshno_sb  = 637097
        //Otkaz_sb = 637099
        //Summa_rashoda = 637165
        //Primechanie_k_rashodu = 637167
        //Shkola_nomer = 642557
        //Plan_po_zayavkam = 645691
        //Plan_po_prodagham = 646135
        //Plan_po_zapisyam = 646183
        //Plan_po_probnym = 646185
        //Nazvanie_smeny_letney_programmy = 670969
        //Chastichno_sb = 675058
        //contact_id =
        //Dogovor_na_obuchenie = 609995
        //Dogovor_intensiv = 679445
        //OS_cherez_mesyac_vzyata = 679611

    }

    fclose($log_file);



