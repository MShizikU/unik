<?php

    require("curl_requester.php");
    require("amo_response_decomposer.php");

    $amo_domain = "okenglish.amocrm.ru";

    $access_token = file_get_contents('access_token.txt');

    $log_file = fopen("log.txt", "w");

    $hostDB = "krymkibs.beget.tech";
    $usernameDB = "krymkibs_amo";
    $passwordDB = "CQi%*6o&";
    $nameDB = "";

    $database = mysqli_connect($hostDB, $usernameDB, $passwordDB, $nameDB);

    if ($database == false){
        echo "Database error: " . mysqli_connect_error();
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
            $leadsData = array_merge($responseData->_embedded->leads);
            $nextPage = $responseData->_links->next;
            $checker = ($nextPage != null);
            $pageCounter = $pageCounter + 1;
        }else{
            $checker = false;
        }
    }


    foreach($leadsData as $key => $lead) {


        $customFields = [609943, 609949, 609953, 609961, 609963, 609981, 609985, 637083, 637085, 637087, 637089, 637091, 637093, 637095, 637097, 637099, 637165, 637167, 642557, 645691, 646135, 646183, 646185, 670969, 675058, 609995, 679445, 679611 ];
        $customFieldValues = getCustomFieldValues($lead, $customFields);
        fwrite($log_file, "\n" . $key . ":" . $leadContactID . "\n" . print_r($customFieldValues, true). "\n");

        $data = array(
            "id" => $lead->id,
            "name" => $lead->name,
            "price" => $lead->price,
            "responsible_user_id" => $lead->responsible_user_id,
            "status_id" => $lead->status_id,
            "pipeline_id" => $lead->pipeline_id,
            "created_by" => $lead->created_by;,
            "updated_by" => $lead->updated_by,
            "closed_at" => $lead->closed_at,
            "created_at" => $lead->created_at,
            "updated_at" => $lead->updated_at,
            "account_id" => $lead->account_id,
            "contact_id" => $lead->_embedded->contacts[0]->id,
            "FIO_obuchaemogo" => $customFieldValues[609943],
            "Kakaya_obrazovatelynaya_programma" => $customFieldValues[609949],
            "Cely_obucheniya" => $customFieldValues[609953],
            "Otkuda_uznali_o_nas" => $customFieldValues[609961],
            "Filial_dlya_posescheniya" => $customFieldValues[609963],
            "Prichina_otkaza" => $customFieldValues[609981],
            "Otkaz_podrobno" => $customFieldValues[609985],
            "Beseda_sb" => $customFieldValues[637083],
            "Podbor_vremeni_sb" => $customFieldValues[637085],
            "Zapisalsya_na_probnoe_sb" => $customFieldValues[637087],
            "Ne_proshel_probnoe_sb" => $customFieldValues[637089],
            "Dumaet_posle_probnogo_sb" => $customFieldValues[637091],
            "Podbor_raspisaniya_sb" => $customFieldValues[637093],
            "Oghidaem_oplatu_sb" => $customFieldValues[637095],
            "Uspeshno_sb" => $customFieldValues[637097],
            "Otkaz_sb" => $customFieldValues[637099],
            "Summa_rashoda" => $customFieldValues[637165],
            "Primechanie_k_rashodu" => $customFieldValues[637167],
            "Shkola_nomer" => $customFieldValues[642557],
            "Plan_po_zayavkam" => $customFieldValues[645691],
            "Plan_po_prodagham" => $customFieldValues[646135],
            "Plan_po_zapisyam" => $customFieldValues[646183],
            "Plan_po_probnym" => $customFieldValues[646185],
            "Nazvanie_smeny_letney_programmy" => $customFieldValues[670969],
            "Chastichno_sb" => $customFieldValues[675058],
            "Dogovor_na_obuchenie" => $customFieldValues[609995],
            "Dogovor_intensiv" => $customFieldValues[679445],
            "OS_cherez_mesyac_vzyata" => $customFieldValues[679611]
        );

        $checkIfExistSQL = 'SELECT * FROM leads WHERE id = ' . $leadID;

        $checkIfExistRequest = mysqli_query($database, $checkIfExistSQL);

        if (mysqli_num_rows($checkIfExistRequest) == 0){
            $insertLeadIntoDbSQL = "INSERT INTO leads ('" . implode("', '", array_keys($data)) . "') VALUES ('" .implode("', '", array_values($data)) . "')";
            if (mysqli_query($database, $insertLeadIntoDbSQL)){
                
            }else{
                echo "Database insert error";
            }
        }else{
            $updateLeadDbSQL = "UPDATE leads
            SET name = '{$data['name']}',
            price = '{$data['price']}',
            responsible_user_id = '{$data['responsible_user_id']}',
            status_id = '{$data['status_id']}',
            pipeline_id = '{$data['pipeline_id']}',
            created_by = '{$data['created_by']}',
            updated_by = '{$data['updated_by']}',
            closed_at = '{$data['closed_at']}',
            created_at = '{$data['created_at']}',
            updated_at = '{$data['updated_at']}',
            account_id = '{$data['account_id']}',
            contact_id ='{$data['contact_id']}',
            FIO_obuchaemogo = '{$data['FIO_obuchaemogo']}',
            Kakaya_obrazovatelynaya_programma = '{$data['Kakaya_obrazovatelynaya_programma']}',
            Cely_obucheniya = '{$data['Cely_obucheniya']}',
            Otkuda_uznali_o_nas = '{$data['Otkuda_uznali_o_nas']}',
            Filial_dlya_posescheniya = '{$data['Filial_dlya_posescheniya']}',
            Prichina_otkaza = '{$data['Prichina_otkaza']}',
            Otkaz_podrobno = '{$data['Otkaz_podrobno']}',
            Beseda_sb = '{$data['Beseda_sb']}',
            Podbor_vremeni_sb = '{$data['Podbor_vremeni_sb']}',
            Zapisalsya_na_probnoe_sb = '{$data['Zapisalsya_na_probnoe_sb']}',
            Ne_proshel_probnoe_sb = '{$data['Ne_proshel_probnoe_sb']}',
            Dumaet_posle_probnogo_sb = '{$data['Dumaet_posle_probnogo_sb']}',
            Podbor_raspisaniya_sb = '{$data['Podbor_raspisaniya_sb']}',
            Oghidaem_oplatu_sb ='{$data['Oghidaem_oplatu_sb']}',
            Uspeshno_sb = '{$data['Uspeshno_sb']}',
            Otkaz_sb = '{$data['Otkaz_sb']}',
            Summa_rashoda = '{$data['Summa_rashoda']}',
            Primechanie_k_rashodu = '{$data['Primechanie_k_rashodu']}',
            Shkola_nomer = '{$data['Shkola_nomer']}',
            Plan_po_zayavkam = '{$data['Plan_po_zayavkam']}',
            Plan_po_prodagham = '{$data['Plan_po_prodagham']}',
            Plan_po_zapisyam = '{$data['Plan_po_zapisyam']}',
            Plan_po_probnym = '{$data['Plan_po_probnym']}',
            Nazvanie_smeny_letney_programmy = '{$data['Nazvanie_smeny_letney_programmy']}',
            Chastichno_sb = '{$data['Chastichno_sb']}',
            Dogovor_na_obuchenie = '{$data['Dogovor_na_obuchenie']}',
            Dogovor_intensiv = '{$data['Dogovor_intensiv']}',
            OS_cherez_mesyac_vzyata = '{$data['OS_cherez_mesyac_vzyata']}'
        WHERE id = '{$data['id']}'";
            if ($database->query($updateLeadDbSQL) === TRUE) {
                echo "Lead record updated successfully";
            } else {
                echo "Error updating lead record: " . $conn->error;
            }
            
        }

    }

    fclose($log_file);



