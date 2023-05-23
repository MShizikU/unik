<?php

function execCURLRequest($url, $headers, $postData, $request_method){

    $requestResult = array();

    $request = curl_init($url);

    curl_setopt($request, CURLOPT_CUSTOMREQUEST, $request_method);
    curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($request, CURLOPT_USERAGENT,'amoCRM-oAuth-client/1.0');
    curl_setopt($request, CURLOPT_HTTPHEADER, $headers);
    if ($postData != null){
        curl_setopt($request, CURLOPT_POSTFIELDS, $postData);
    }

    $requestResult['response'] = curl_exec($request);

    $requestResult['code'] = curl_getinfo($request, CURLINFO_HTTP_CODE);

    curl_close($request);

    return $requestResult;

}

?>