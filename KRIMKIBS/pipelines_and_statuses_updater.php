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


    }

}else{
    $checker = false;
}





fclose($log_file);