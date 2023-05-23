<?php

require("curl_requester.php");
require("amo_response_decomposer.php");

$amo_domain = "okenglish.amocrm.ru";

$access_token = file_get_contents('access_token.txt');

$log_file = fopen("log.txt", "w");

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
        $pipelineID = $pipeline->id;
        $pipelineName = $pipeline->name;

        $getPipelinesStatusesRequest = execCURLRequest('https://'. $amo_domain . '/api/v4/leads/pipelines/' . $pipelineID . '/statuses', $headers, null, "GET");
        $pipelinesStatusesResponse = $getPipelinesStatusesRequest['response'];
        $pipelinesStatusesCode = $getPipelinesStatusesRequest['code'];

        fwrite($log_file, "\nВоронка" . $key . " " . $pipelineID . " " . $pipelineName . " \nstatuses: ");

        if ($pipelinesStatusesCode >= 200 && $pipelinesStatusesCode <= 204){
            $statuses = json_decode($pipelinesStatusesResponse)->_embedded->statuses;
            foreach ($statuses as $key => $status){
                $statusID = $status->id;
                $statusName = $status->name;
                $statusPipelineID = $status->pipeline_id;

                fwrite($log_file, "\n" . $statusID . " ". $statusName . " " . $statusPipelineID);
            }
        }
    }

}else{
    http_response_code($pipelinesCode);
}





fclose($log_file);