<?php

header('Content-Type: application/json; charset=utf-8');

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$mysql = mysqli_connect("db", "user", "password", "appDB");
$result = array();

if ($mysql){
    if ($_SERVER['REQUEST_METHOD'] == 'GET'){
        parse_str($_SERVER['QUERY_STRING'], $data);
        if (!array_key_exists('id', $data)){
            $resDB = mysqli_query($mysql, 'SELECT * FROM note');
            if ($resDB != false){
                $result['result'] = 'Success';
                foreach($resDB as $row){
                    $result['items'][] = array("id" => $row['id'], "fullname" => $row['fullname'], "phone" => $row['phone'], "description" => $row['description']);
                }
            }
            else{
                $result['result'] = "Database error";
                $result['message'] = mysqli_error($mysql);
            }
        }else{
            $resDB = mysqli_query($mysql, "SELECT * FROM note WHERE `id` = '" . $data['id'] . "'");
            if ($resDB != false){
                $result['result'] = 'Success';
                foreach($resDB as $row){
                    $result['items'][] = array("id" => $row['id'], "fullname" => $row['fullname'], "phone" => $row['phone'], "description" => $row['description']);
                }
            }
            else{
                $result['result'] = "Database error";
                $result['data'] = $data;
                $result['message'] = mysqli_error($mysql);
            }
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $data = $_POST;
        if ($data['fullname'] != null && $data['phone'] != null && $data['description'] != null){
            $resDB = mysqli_query($mysql, "INSERT INTO note(fullname,phone,description) VALUES ('" . $data['fullname'] . "','" . $data['phone'] . "','" . $data['description'] . "')");
            $result['result'] = $resDB;
        }else{
            $result['result'] = "Request error";
            $result['data'] = $data;
            $result['message'] = "Wrong passed data";
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'PUT'){
        parse_str(file_get_contents("php://input"),$data);
        if ($data['fullname'] != null && $data['id'] != null && $data['phone'] != null && $data['description'] != null){
            $resDB = mysqli_query($mysql, "UPDATE note SET `fullname` = '" . $data['fullname'] . "' WHERE `id` = '" . $data['id'] . "'");
            if ($resDB)
                $resDB = mysqli_query($mysql, "UPDATE note SET `phone` = '" . $data['phone'] . "' WHERE `id` = '" . $data['id'] . "'");
            if ($resDB)
                $resDB = mysqli_query($mysql, "UPDATE note SET `description` = '" . $data['description'] . "' WHERE `id` = '" . $data['id'] . "'");
            $result['result'] = $resDB;
            if (!$resDB){
                $result['error'] = mysqli_error($mysql);
            }
        }else{
            $result['result'] = "Request error";
            $result['data'] = $data;
            $result['message'] = "Wrong passed data";
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'DELETE'){
        parse_str(file_get_contents("php://input"),$data);
        if ($data['id'] != null){
            $resDB = mysqli_query($mysql, "DELETE FROM note WHERE `id` = '" . $data['id'] . "'");
            $result['result'] = $resDB;
        }else{
            $result['result'] = "Request error";
            $result['data'] = $data;
            $result['message'] = "Wrong passed data";
        }
    }
}
else{
    $result['result'] = "Database error";
}

echo json_encode($result);