<?php

function execCURLRequest($url, $headers, $postData, $request_method){

    $requestResult = array();

    $request = curl_init($url);

    curl_setopt($request, CURLOPT_CUSTOMREQUEST, $request_method);
    curl_setopt($ch, CURLOPT_REFERER, 'http://krymkibs.beget.tech');
    curl_setopt($request, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($request, CURLOPT_HTTPHEADER, $headers);
    if ($postData != null){
        curl_setopt($request, CURLOPT_POSTFIELDS, $postData);
    }

    $requestResult['response'] = curl_exec($request);

    $requestResult['info'] = curl_getinfo($request);

    $requestResult['code'] = curl_getinfo($request, CURLINFO_HTTP_CODE);



    curl_close($request);

    return $requestResult;

}

?>