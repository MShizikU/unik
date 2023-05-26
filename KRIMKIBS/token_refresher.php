<?php

    $domain = "okenglish.amocrm.ru";
    $client_id = '5fecdbfd-e09d-4296-9739-f095b6369d24';
	$client_secret = "X4pcbLlQmxXFeICcBtrVSYi4imNx4IUhemeFLzs9Wd65jiFdNVZ1EB4oY1TfERGI";
	$auth_code = "def5020094348989288aed45b381be79308e56b877a99e7ef53c55ec6c212e158d3ed30ca5a68cd09b08113037747066fce5a5df96731ac0ee7f930d982053b69a192006e714146934a4af410e991f0397dfe5985949d816ff9eb7860cebbff5d9e6b138253f6d706297148bd843f48af6a73dc02cfdc15335c248a70a5fdc762c6000c2874b19524f4c5e7581aa4ac603b1de042fa5c6d2f89c3a777a534507eb23c35657ceb04dcecdbf999c7c8e5a7ebcdc1203e2a977d0b26857406b5c37728cfc5d4b68d6b7e89b9bbddbd4ccb6f0fc132e350faa755667081ecbe81c29b472ebce0dead31cbfe976b70ee725dcd96d095ef9060d5119a4f513cc640f945fddc4d9a3d23c619bde97aa0f09f6eb24bb1619344a76e0b533da5aaf57a3a0650f3d30d4e49a842e28665fc8352dbb391196b66cf2d7a3ca90e61d540877978158bfcf6ebbc8388ed057a78f5d0a1e5c4ac860c107586d3fd41616d3e96ae62a94455c3b8c15e04eebfe3f2ff773971007873a0928c45fec4737dd49e67340e2e41961a6b125a7d1d03098d8b15f8de37dafb43f3946475c0a01c2f1a2a1628241c17aef27dc95a5d8f0660556fcc03270e7ff2235d3096ddc72bb18e7ffc9256e5406a29ddf32f309e6bfdb7b791d98725a0d0dc0be99434d45f38d2617645ed6e80870024e0cbb5b83e4bbf76b5b87a07cbb588d93";

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
            "redirect_uri" => "http://krymkibs.beget.tech/okenglish/"
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
                "redirect_uri" => "http://krymkibs.beget.tech/okenglish/"
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
                "redirect_uri" => "http://krymkibs.beget.tech/okenglish/"
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

    

    