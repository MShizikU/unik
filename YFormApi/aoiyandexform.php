<?php

class apiyandexform extends apiBaseClass{

    function sendInfoToAMOCrm($apiMethodParams) {
        $retJSON = $this->createDefaultJson();
        if (isset($apiMethodParams->UserFormName) and isset($apiMethodParams->UserFormNumber) and isset($apiMethodParams->UserFromEmail) and isset($apiMethodParams->UserFormComment)){
            $userName = $apiMethodParams->UserFormName;
            $userNumber = $apiMethodParams->UserFormNumber;
            $userEmail = $apiMethodParams->UserFromEmail;
            $UserComment = $apiMethodParams->UserFormComment;


            $contactCreationData =  [
                "name" => $userName,
                "custom_fields_values" => [
                        [
                         "field_id" => 271316, 
                         "values" => [
                                [
                                    "value" => $userNumber 
                                ] 
                            ] 
                        ],
                        [
                            "field_id" => 122312, 
                            "values" => [
                               [
                                  "value" => $userEmail 
                               ] 
                            ] 
                        ]
                   ] 
             ]; 

            $contactCreationRequest = curl_init('https://example.com/api/v4/leads');
            curl_setopt($contactCreationRequest, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
            curl_setopt($contactCreationRequest, CURLOPT_POST, 1);
            curl_setopt($contactCreationRequest, CURLOPT_POSTFIELDS, json_encode($leadCreationData, JSON_UNESCAPED_UNICODE)); 
            curl_setopt($contactCreationRequest, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($contactCreationRequest, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($contactCreationRequest, CURLOPT_HEADER, false);
            $resContactCreation = curl_exec($contactCreationRequest);
            curl_close($contactCreationRequest);

            if(isset(($resContactCreation->_embedded->contacts)[0]->id)){
                $contactCreatedID = ($resContactCreation->_embedded->contacts)[0]->id
                $leadCreationData = array(
                    'name'    => "{$userName}/ заявка с яндекс бизнес / {$userNumber}",
                    "_embedded" => [
                    	"contacts" =>array(
                    		    "id" => $contactCreatedID
                            )
                    	]
                );	
                 
                $leadCreationRequest = curl_init('https://example.com/api/v4/leads');
                curl_setopt($leadCreationRequest, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
                curl_setopt($leadCreationRequest, CURLOPT_POST, 1);
                curl_setopt($leadCreationRequest, CURLOPT_POSTFIELDS, json_encode($leadCreationData, JSON_UNESCAPED_UNICODE)); 
                curl_setopt($leadCreationRequest, CURLOPT_RETURNTRANSFER, true);
                curl_setopt($leadCreationRequest, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($leadCreationRequest, CURLOPT_HEADER, false);
                $resLeadCreation = curl_exec($leadCreationRequest);
                curl_close($leadCreationRequest);
            }else{
                $retJSON->error= APIConstans::$ERROR_PARAMS;
                return $retJSON;
            }

        }else{
            $retJSON->error= APIConstans::$ERROR_PARAMS;
        }
        return $retJSON;
    }
}
?>
