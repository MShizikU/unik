<?php

require("curl_requester.php");
require("amo_response_decomposer.php");
require("db_operations.php");

$amo_domain = "okenglish.amocrm.ru";

$file_basement = "krymkibs.beget.tech/public_html/okenglish/";

$access_token = file_get_contents($file_basement . 'access_token.txt');

$log_file = fopen($file_basement . "log.txt", "a");
fwrite($log_file, "\nPIPELINES AND STATUSES UPDATER\n");

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

$getPipelinesRequestResult = execCURLRequest('https://'. $amo_domain . '/api/v4/leads/pipelines', $headers, null, "GET");
$pipelinesResponse = $getPipelinesRequestResult['response'];
$pipelinesCode = $getPipelinesRequestResult['code'];

//fwrite($log_file,  "Get pipelines response: \n" . $pipelinesResponse . "\n");
//fwrite($log_file,  "Get pipelines code: \n" . $pipelinesCode . "\n");

if ($pipelinesCode >= 200 && $pipelinesCode <= 204) {
    $responseData = json_decode($pipelinesResponse);
    $pipelinesData = $responseData->_embedded->pipelines;

    foreach($pipelinesData as $key => $pipeline) {
        $pipeLineData = array(
            "id" => $pipeline->id,
            "name" => $pipeline->name
        );

        execSaveInBd("pipelines", $pipeLineData, $log_file, $database, array("id"));

        $getPipelinesStatusesRequest = execCURLRequest('https://'. $amo_domain . '/api/v4/leads/pipelines/' . $pipeline->id . '/statuses', $headers, null, "GET");
        $pipelinesStatusesResponse = $getPipelinesStatusesRequest['response'];
        $pipelinesStatusesCode = $getPipelinesStatusesRequest['code'];

        //fwrite($log_file, $pipelinesStatusesResponse);

        if ($pipelinesStatusesCode >= 200 && $pipelinesStatusesCode <= 204){
            $statuses = json_decode($pipelinesStatusesResponse)->_embedded->statuses;
            foreach ($statuses as $key => $status){
                $statusID = $status->id;
                $statusName = $status->name;
                $statusPipelineID = $status->pipeline_id;

                $statusData = array(
                    "status_id" => $status->id,
                    "name" => $status->name,
                    "pipeline_id" => $status->pipeline_id
                );

                execSaveInBd("status", $statusData, $log_file, $database, array( "status_id", "pipeline_id"));
            }
        }else{
            fwrite($log_file, "\nError: " .  $pipelinesStatusesCode . " " . $pipelinesStatusesResponse);
        }
    }

}else{
    fwrite($log_file, "\nError: " .  $pipelinesCode . " " . $pipelinesResponse);
    http_response_code($pipelinesCode);
}


fclose($log_file);