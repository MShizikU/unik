<?php

    require("curl_requester.php");
    require("amo_response_decomposer.php");
    require("db_operations.php");

    date_default_timezone_set('Europe/Moscow');

    $amo_domain = "okenglish.amocrm.ru";

    $file_basement = "krymkibs.beget.tech/public_html/okenglish/";

    $access_token = file_get_contents($file_basement . 'access_token.txt');

    $log_file = fopen($file_basement . "log.txt", "a");
    fwrite($log_file, "\nLEADS UPDATER\n");

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
            $leadsData = array_merge($leadsData, $responseData->_embedded->leads);
            $nextPage = $responseData->_links->next;
            $checker = ($nextPage !== null);
            $pageCounter = $pageCounter + 1;
        }else{
            fwrite($log_file, "\nError: " .  $leadsCode . " " . $leadsResponse);
            $checker = false;
        }
    }

    foreach($leadsData as $key => $lead) {
        //fwrite($log_file, "\n" .print_r($lead, true). "\n");
        $customFields = [609943, 609949, 609953, 609961, 609963, 609981, 609985, 637083, 637085, 637087, 637089, 637091, 637093, 637095, 637097, 637099, 637165, 637167, 642557, 645691, 646135, 646183, 646185, 670969, 675058, 609995, 679445, 679611 ];
        $customFieldValues = getCustomFieldValues($lead, $customFields);

        //fwrite($log_file, "\n" . $key . ":" .$lead->id. "\n" . print_r($customFieldValues, true). "\n");

        $data = array(
            "id" => $lead->id,
            "name" => $lead->name,
            "price" => $lead->price,
            "responsible_user_id" => $lead->responsible_user_id,
            "status_id" => $lead->status_id,
            "pipeline_id" => $lead->pipeline_id,
            "created_by" => $lead->created_by,
            "updated_by" => $lead->updated_by,
            "account_id" => $lead->account_id,
            "contact_id" => $lead->_embedded->contacts[0]->id,
            "closed_at" => ($lead->closed_at != null) ? DateTime::createFromFormat('U', $lead->closed_at)->format('Y-m-d H:i:s') : null,
            "created_at" => ($lead->created_at != null) ?DateTime::createFromFormat('U',$lead->created_at)->format('Y-m-d H:i:s') : null,
            "updated_at" => ($lead->updated_at != null) ? DateTime::createFromFormat('U',$lead->updated_at)->format('Y-m-d H:i:s') : null,
            "Beseda_sb" => ($customFieldValues[637083] != null) ? date('Y-m-d',$customFieldValues[637083]) : null,
            "Podbor_vremeni_sb" => ($customFieldValues[637085] != null) ?  date('Y-m-d',$customFieldValues[637085]) : null,
            "Zapisalsya_na_probnoe_sb" => ($customFieldValues[637087] != null) ?  date('Y-m-d',$customFieldValues[637087]) : null,
            "Ne_proshel_probnoe_sb" =>  ($customFieldValues[637089] != null) ? date('Y-m-d',$customFieldValues[637089]) : null,
            "Dumaet_posle_probnogo_sb" => ($customFieldValues[637091] != null) ?  date('Y-m-d',$customFieldValues[637091]) : null,
            "Podbor_raspisaniya_sb" => ($customFieldValues[637093] != null) ? date('Y-m-d',$customFieldValues[637093]) : null,
            "Oghidaem_oplatu_sb" => ($customFieldValues[637095] != null) ? date('Y-m-d',$customFieldValues[637095]) : null,
            "Uspeshno_sb" => ($customFieldValues[637097] != null) ? date('Y-m-d',$customFieldValues[637097]) : null,
            "Otkaz_sb" => ($customFieldValues[637099] != null) ? date('Y-m-d',$customFieldValues[637099]) : null,
            "Chastichno_sb" => ($customFieldValues[675058] != null) ? date('Y-m-d',$customFieldValues[675058]) : null,
            "FIO_obuchaemogo" => $customFieldValues[609943],
            "Kakaya_obrazovatelynaya_programma" => $customFieldValues[609949],
            "Cely_obucheniya" => $customFieldValues[609953],
            "Otkuda_uznali_o_nas" => $customFieldValues[609961],
            "Filial_dlya_posescheniya" => $customFieldValues[609963],
            "Prichina_otkaza" => $customFieldValues[609981],
            "Otkaz_podrobno" => $customFieldValues[609985],
            "Summa_rashoda" => $customFieldValues[637165],
            "Primechanie_k_rashodu" => $customFieldValues[637167],
            "Shkola_nomer" => $customFieldValues[642557],
            "Plan_po_zayavkam" => $customFieldValues[645691],
            "Plan_po_prodagham" => $customFieldValues[646135],
            "Plan_po_zapisyam" => $customFieldValues[646183],
            "Plan_po_probnym" => $customFieldValues[646185],
            "Nazvanie_smeny_letney_programmy" => $customFieldValues[670969],
            "Dogovor_na_obuchenie" => $customFieldValues[609995],
            "Dogovor_intensiv" => $customFieldValues[679445],
            "OS_cherez_mesyac_vzyata" => $customFieldValues[679611]
        );
        execSaveInBd("leads", $data, $log_file, $database, array("id"));

        $tagsList = $lead->_embedded->tags;

        $getAllTagsFromDBSQL = "SELECT id, tag_id, name FROM tags WHERE lead_id = '" . $lead->id . "'";
        $getTasgRequest = mysqli_query($database, $getAllTagsFromDBSQL);
        while($row = mysqli_fetch_array($result))
        {   
            $isDeleted = true;
            foreach($tagsList as $key => $tag){
                if ($tag->id == $row['tag_id'] and $tag->name == $row['name']){
                    $isDeleted = false;
                    unset($tagsList[$key]);
                }
            }
            if ($isDeleted){
                $deleteTagSQL = "DELETE FROM tags WHERE id = '" . $row['id'] . "'";
                if (!mysqli_query($database, $deleteTagSQL)){
                    fwrite($log_file, "\nDatabase error: " . $database->error);
                } 
            }
        } 
        foreach($tagsList as $key => $tag){
            $tagId = $tag->id;
            $tagName = $tag->name;

            $insertTagSQL = 'INSERT INTO tags ( lead_id, tag_id, name) VALUES ( ' . $lead->id . " , " . $tagId . " , '" . $tagName. "')";
            if (!mysqli_query($database, $insertTagSQL)){
                fwrite($log_file, "\nRequest: " . $insertTagSQL);
                fwrite($log_file, "\nDatabase error: " . $database->error);
            }
        }

    }
    $database->close();
    fclose($log_file);

    

