<?php

class apiYandexForm extends apiBaseClass{

    //http://hostcot.ru/api/?apitest.helloAPIWithParams={"TestParamOne":"Text of first parameter"}
    function sendInfoToAMOCrm($apiMethodParams) {
        $retJSON = $this->createDefaultJson();
        if (isset($apiMethodParams->UserFormName)){
            $retJSON->retParameter=$apiMethodParams;
        }else{
            $retJSON->errorno= $apiMethodParams;
        }
        return $retJSON;
    }
}
?>
