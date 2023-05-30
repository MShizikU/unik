<?php

    $domain = "okenglish.amocrm.ru";
    $client_id = '5fecdbfd-e09d-4296-9739-f095b6369d24';
	$client_secret = "X4pcbLlQmxXFeICcBtrVSYi4imNx4IUhemeFLzs9Wd65jiFdNVZ1EB4oY1TfERGI";
	$auth_code = "def50200fde488c2772d6c12a6444356fba732eeb5774cb30e50bb71f7c1da67ae8bf5c1cf95b3deed9750d5dcadc5227b3bb268a44168e4d4c50cd3e3142e5baf37efa43ae3c326acd204ebb9335d2f5ddaf0596795951c54f508b7fd32aa5a7a3bdb0761c3490a010b39a3dde9151df35af55849505aa5b37088f9deb9ce6e5e23271c573179b979333f3e8eacdb37ac512850b385ff841382471732fbaff42e790a8e9a3d2468353a5bcf6e57e668258348ec2a7334df60cc6f83a6b5f51dc86c8f38604994696101b09082bec5c28f73425d722038f36cb28eb6de5a3fa3490730c8ec6082827d74d3e55c0260b17e0d073166c3815a23f65f45881dbda3ec5a03ad3b233eb84842756b34246e10ad0e4ea99d4bc1f8fdf8d37f1b2ddd07cb80bd77d195b01bfb0163828e8e94ec25e259b0c879e33fe9498de93527227a93ad3af37dc344d5af945f3aa36b8c4db18e67b1c2cfe2c41f66784fbd2ed43354315fa8b932e38c8917c09f7c257df6bcda2b65c4738b5f24041685ae7ee1a201eae26b58ff599dcf589eda789329eca08ad30ee6a87488a4fcf72ef7efc658f0a51a4b8397b70b98092725e2eebfae3cd730573682230c0117ba03fd875feffc2045032e8653d3b097986d7517bf4c29e859159780b56bf39bfee63121ff3201c66559e9d7a8447172de15c211b9bd196d62f02fa04f907e3d7a22b9fd3c66eb063e86";

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

    

    