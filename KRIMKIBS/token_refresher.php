<?php

    $domain = "okenglish.amocrm.ru";
    $client_id = '5fecdbfd-e09d-4296-9739-f095b6369d24';
	$client_secret = "X4pcbLlQmxXFeICcBtrVSYi4imNx4IUhemeFLzs9Wd65jiFdNVZ1EB4oY1TfERGI";
	$auth_code = "def50200ff5f2ed8f59bf6033024068217b006cca7e4920a726fbeec639963062048df621a70996e0ddbd816a92d295e5a6a1d26e99443a2b3cb0db06e0d5696914eda5b8533a552206d6e63899bfe40cf3a7cc37d51cc9f80f1339f466bf91fdd84c2923bdf2158d6812556476320204994d982495a93bcf42b7eece92661cab001fd0b060892da3d42186f9f6e8fc251b7f0631c23f3bbb09ab8329ceee0b8b8bba644bc6939bf8d5e2a045bc1550ddf36dde8c62e8897407c7a6d0cb61c7c616d7c648866b6745c52246a9c185987e17f667cf30ac7f06e77bbab49d6839919ff2cf7b6d422ba37af4544836da9a1fdbfc8a0ab2bc4ee0f32708a2a3e36263030380dd6e4e4fd850d942e32362e8cba055862ba7441342d0e99e6337dcab680b102914d7df01fb51822bcacf90a30defd5d19e96fc9909541ab21f84fefe6d307b280652a7c7853c5146b7e7c4ad40666c0c925f7f8872672f538eb08fe5f2428d7dbedce644c6b4ded0a95e07712118c35add55fcbb7aec8edb6512038ea1b7607acf1a40f6556f38a252999905307494e9eabd5254a1947a4f0dc41801d42945da0ce26806e4ba9351277ad59a713357121ea07e06904d561a03d0642990d737f0f5ad3a2bc0a11b7cf6c5d55bf0a9a26d1fe36489a3286103654780b5813ebf065cf8e9255d171e0e0528896";

    $refresh_code_file = 'refresh_token.txt';
    $access_code_file = 'access_token.txt';

    $headers = [
        'Content-Type: application/json'
    ];

    $refresh_code_handle = fopen($refresh_code_file, 'r');

    if ($refresh_code_handle === false) {
        $refresh_via_auth_code = [
            "client_id" => $client_id,
            "client_secret" => $client_secret,
            "grant_type" => "authorization_code",
            "code" => $auth_code,
            "redirect_uri" => "https://hostcot.ru/okenglish/"
        ];

        $getNewCodesRequest = curl_init('https://'. $domain . '/oauth2/access_token');
        curl_setopt($getNewCodesRequest, CURLOPT_POST, true);
        curl_setopt($getNewCodesRequest,CURLOPT_RETURNTRANSFER, true);
        curl_setopt($getNewCodesRequest, CURLOPT_POSTFIELDS, json_encode($refresh_via_auth_code));
        curl_setopt($getNewCodesRequest,CURLOPT_HTTPHEADER, $headers);
        curl_setopt($getNewCodesRequest,CURLOPT_HEADER, false);
        curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYPEER, 1);
        curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYHOST, 2);
        $resNewCodes = curl_exec($getNewCodesRequest);

        $code = curl_getinfo($getNewCodesRequest, CURLINFO_HTTP_CODE);
        curl_close($getNewCodesRequest);

        try
        {
            if ($code < 200 || $code > 204) {
                throw new Exception(isset($errors[$code]) ? $errors[$code] : 'Undefined error', $code);
            }
            else{

                $arrayOfCodes = json_decode($resNewCodes);


                $access_token = $arrayOfCodes->access_token;

                $refresh_token = $arrayOfCodes->refresh_token;

                $access_file = fopen($access_code_file, 'w');

                fwrite($access_file, $access_token);

                fclose($access_file);

                $refresh_file = fopen($refresh_code_file, 'w');

                fwrite($refresh_file, $refresh_token);

                fclose($refresh_file);
            }
        }
        catch(Exception $e)
        {
            die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
        }
    }
    else
    {
        $refresh_code = fread($refresh_code_handle, filesize($refresh_code_file));
        if ($refresh_code === false) {
            $refresh_via_auth_code = [
                "client_id" => $client_id,
                "client_secret" => $client_secret,
                "grant_type" => "authorization_code",
                "code" => $auth_code,
                "redirect_uri" => "https://hostcot.ru/okenglish/"
            ];

            $getNewCodesRequest = curl_init('https://'. $domain . '/oauth2/access_token');
            curl_setopt($getNewCodesRequest, CURLOPT_POST, true);
            curl_setopt($getNewCodesRequest,CURLOPT_RETURNTRANSFER, true);
            curl_setopt($getNewCodesRequest, CURLOPT_POSTFIELDS, json_encode($refresh_via_auth_code));
            curl_setopt($getNewCodesRequest,CURLOPT_HTTPHEADER, $headers);
            curl_setopt($getNewCodesRequest,CURLOPT_HEADER, false);
            curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYPEER, 1);
            curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYHOST, 2);
            $resNewCodes = curl_exec($getNewCodesRequest);

            $code = curl_getinfo($getNewCodesRequest, CURLINFO_HTTP_CODE);
            curl_close($getNewCodesRequest);

            $errors = [
                400 => 'Bad request',
                401 => 'Unauthorized',
                403 => 'Forbidden',
                404 => 'Not found',
                500 => 'Internal server error',
                502 => 'Bad gateway',
                503 => 'Service unavailable',
            ];
            try
            {
                if ($code < 200 || $code > 204) {
                    throw new Exception(isset($errors[$code]) ? $errors[$code] : 'Undefined error', $code);
                }
                else{
                    $arrayOfCodes = json_decode($resNewCodes);


                    $access_token = $arrayOfCodes->access_token;

                    $refresh_token = $arrayOfCodes->refresh_token;

                    $access_file = fopen($access_code_file, 'w');

                    fwrite($access_file, $access_token);

                    fclose($access_file);

                    $refresh_file = fopen($refresh_code_file, 'w');

                    fwrite($refresh_file, $refresh_token);

                    fclose($refresh_file);
                }
            }
            catch(Exception $e)
            {
                die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
            }
        }
        else{

            $refresh_via_token = [
                "client_id" => $client_id,
                "client_secret" => $client_secret,
                "grant_type" => "refresh_token",
                "refresh_token" => $refresh_code,
                "redirect_uri" => "https://hostcot.ru/okenglish/"
            ];

            $getNewCodesRequest = curl_init('https://'. $domain . '/oauth2/access_token');            
            curl_setopt($getNewCodesRequest, CURLOPT_POST, true);
            curl_setopt($getNewCodesRequest,CURLOPT_RETURNTRANSFER, true);
            curl_setopt($getNewCodesRequest, CURLOPT_POSTFIELDS, json_encode($refresh_via_token));
            curl_setopt($getNewCodesRequest,CURLOPT_HTTPHEADER, $headers);
            curl_setopt($getNewCodesRequest,CURLOPT_HEADER, false);
            curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYPEER, 1);
            curl_setopt($getNewCodesRequest,CURLOPT_SSL_VERIFYHOST, 2);
            $resNewCodes = curl_exec($getNewCodesRequest);

            $code = curl_getinfo($getNewCodesRequest, CURLINFO_HTTP_CODE);
            curl_close($getNewCodesRequest);

            $code = (int)$code;
            $errors = [
                400 => 'Bad request',
                401 => 'Unauthorized',
                403 => 'Forbidden',
                404 => 'Not found',
                500 => 'Internal server error',
                502 => 'Bad gateway',
                503 => 'Service unavailable',
            ];

            try
            {
                if ($code < 200 || $code > 204) {
                    throw new Exception(isset($errors[$code]) ? $errors[$code] : 'Undefined error', $code);
                }
                else{
                    $arrayOfCodes = json_decode($resNewCodes);


                    $access_token = $arrayOfCodes->access_token;

                    $refresh_token = $arrayOfCodes->refresh_token;

                    $access_file = fopen($access_code_file, 'w');

                    fwrite($access_file, $access_token);

                    fclose($access_file);

                    $refresh_file = fopen($refresh_code_file, 'w');

                    fwrite($refresh_file, $refresh_token);

                    fclose($refresh_file);
                }
            }
            catch(Exception $e)
            {
                die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
            }
        }
        fclose($refresh_code_handle);
    }

    

    