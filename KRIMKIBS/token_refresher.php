<?php

    $domain = "okenglish.amocrm.ru";
    $client_id = '5fecdbfd-e09d-4296-9739-f095b6369d24';
	$client_secret = "X4pcbLlQmxXFeICcBtrVSYi4imNx4IUhemeFLzs9Wd65jiFdNVZ1EB4oY1TfERGI";
	$auth_code = "def502001299986ec37ac5ce66d32e61427437a9cb6eac2851b0020914eb83fc2997ac57d76658a39b4a043ef45c7f8b3ba79450a7dbe6ef7e575ff5719b16fbb8388a5b2c2c0e0614e603efda267410a19091d1792b40eb0c8ebf4ff53e687c87bfae3639fe8ab5386c76f431294cad4f9191d08e412058971159062fe65ae546bf56d9e814d6002dd5004cd9f656f5f0452c10e86f7c1dd35ec518f505fc96cf941f224253939cd0dd00818f5aac68df8a33e65e8b26090a768f2fe80e7ec84e78c0615bb6ea6f327fea0cd561a949ff0d5fb4bfcc7b1b2950116ddf7c587d3a4dacf33f3649c826323604a30939f46b0f4dae0d82fcebcda738887fbbeed63b6af3b3c1c5245ebe768f8d2acd543dd185481ae20e47725972719476f48bf37aaab1ebc80a0e1c4b73d15019338bb7967ed3826341b88c0bcfe0610fc4dc32761a0e796af0f80b2f103cc5918020bad45136045c49d38732cfb239f77eb7a6ba532bca1a7a526e93dcf11f7d98214fb8aa21d42ff9bb13f31274a22ab40e8b7293e3e1b72ec468beea02a0132f29ecbfc1073c631c63bfbb651c0df286a34c75cf16d03c34c56fefd53036d713cb13b4a78a7504e4a35cfb990e287f837f1b54e1be7aefc83ef3ecf28c9cded82c17c24470a7ee9001dfc89c2cbca525faff24df7f7f38edfcc8922ee3b29a3da23b2d54c9bb23da19";

    $file_basement = "krymkibs.beget.tech/public_html/okenglish/";
    
    $refresh_code_file = $file_basement . 'refresh_token.txt';
    $access_code_file = $file_basement . 'access_token.txt';



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
                throw new Exception($resNewCodes, $code);
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
        if ($refresh_code === null) {
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
                    throw new Exception($resNewCodes, $code);
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
                    throw new Exception($resNewCodes, $code);
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

    

    