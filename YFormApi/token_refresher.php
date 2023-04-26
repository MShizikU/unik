<?php

    $domain = "vienna.amocrm.ru";
    $client_id = '07d3ddef-cff6-4a6a-ab88-624a201ac656';
	$client_secret = "S9QARgoYbWG817MdEljv88vidptCfHBwU1hQ81pdlNtKKlllJE9SdoR0je6T3ABp";
	$auth_code = "def50200dfbc59688b24191da42c05331db32dc764cf6f107fef3cc1326815b836c4cbd605dc08f90dcaadb9d1037fa92fe8f125a24c5094c089f8e8dcd4f714673130b91e9fa78195d1805af06cf61fa54776729fab4bb17030d18ad7494c99de490f758c43a75b389ac88c45c9237c25f004266b0dbd4760d52cc2790e5dbd4d2f1bbf8c2bb91a50d47a7969da1dc496b2088c0f5608dc00c3b002647efd332239e025e95a63b1918c2e18bfc42dd6d2346c1d207cd092237af6fc7cea0e44973cd17afed34dcb530b20e29b39f07acf1174d3660a8ade4b957ab6640804ee2095847d8e80d91391ba7d86907c53bc25c7678f638cd62459aeafddeb62ce99dc8540b6cc58aa5f0d62d8cf473673c152ef626df0f5544912620b045fe302fcb306982158b7204b66194412806bacbe91fa09bd10ef26bc5f9d3f8b79a78e7b4af0139ba8fa69ca85bb84532b6c6dc54c2b54b007807a55d7c0e6aa5b91a5221eb54e0774113c51e53bfc85f00452105eaf8a06432a7a68eb55fbeaf824eab82423455d29f6487ba44d5a6bce456500fbefa6945be0cc244523872287603ae12455c5d9a55b5ee8e06d51595153cb";
	
    $refresh_code_file = 'refresh_token.txt';
    $access_code_file = 'access_token.txt';

    $headers = [
        'Content-Type: application/json'
    ];


    $refresh_code_handle = fopen($file, 'r');

    if ($refresh_code_handle === false) {
        $refresh_via_auth_code = [
            "client_id" => $client_id,
            "client_secret" => $client_secret,
            "grant_type" => "authorization_code",
            "code" => $auth_code,
            "redirect_uri" => "http://hostcot.ru/ucvena/"
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
            
                $access_token = $arrayOfCodes['access_token'];

                file_put_contents($access_code_file, $access_token);

                $refresh_code = $arrayOfCodes['refresh_token'];
                
                file_put_contents($refresh_code, $access_token);
            }
        }
        catch(Exception $e)
        {
            die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
        }
    }
    else{
        $refresh_code = fread($refresh_code_handle, filesize($refresh_code_file));
        if ($refresh_code === false) {
            $refresh_via_auth_code = [
                "client_id" => $client_id,
                "client_secret" => $client_secret,
                "grant_type" => "authorization_code",
                "code" => $auth_code,
                "redirect_uri" => "http://hostcot.ru/ucvena/"
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
                
                    $access_token = $arrayOfCodes['access_token'];
    
                    file_put_contents($access_code_file, $access_token);
    
                    $refresh_code = $arrayOfCodes['refresh_token'];
                    
                    file_put_contents($refresh_code, $access_token);
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
                "redirect_uri" => "http://hostcot.ru/ucvena/"
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
                
                    $access_token = $arrayOfCodes['access_token'];

                    file_put_contents($access_code_file, $access_token);

                    $refresh_code = $arrayOfCodes['refresh_token'];
                    
                    file_put_contents($refresh_code, $access_token);
                }
            }
            catch(Exception $e)
            {
                die('Ошибка: ' . $e->getMessage() . PHP_EOL . 'Код ошибки: ' . $e->getCode());
            }
        }
        fclose($refresh_code_handle);
    }

    

    