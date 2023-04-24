<?php

class apitest extends apiBaseClass{

    //http://hostcot.ru/api/?apitest.helloAPI={}
    function helloAPI() {
        $retJSON = $this->createDefaultJson();
        $retJSON->withoutParams = 'It\'s method called without parameters';
        return $retJSON;
    }

    //http://hostcot.ru/api/?apitest.helloAPIWithParams={"TestParamOne":"Text of first parameter"}
    function helloAPIWithParams($apiMethodParams) {
        $retJSON = $this->createDefaultJson();
        if (isset($apiMethodParams->TestParamOne)){
            $retJSON->retParameter=$apiMethodParams->TestParamOne;
        }else{
            $retJSON->errorno= $apiMethodParams;
        }
        return $retJSON;
    }
    
    //http://hostcot.ru/api/?apitest.helloAPIResponseBinary={"responseBinary":1}
    function helloAPIResponseBinary($apiMethodParams){
        header('Content-type: image/png');
        echo file_get_contents("http://habrahabr.ru/i/error-404-monster.jpg");
    }

}

?>