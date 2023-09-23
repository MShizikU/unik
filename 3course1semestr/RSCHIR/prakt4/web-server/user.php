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
            $resDB = mysqli_query($mysql, 'SELECT * FROM users');
            if ($resDB != false){
                $result['result'] = 'Success';
                foreach($resDB as $row){
                    $result['items'][] = array("id" => $row['id'], "fullname" => $row['fullname']);
                }
            }
            else{
                $result['result'] = "Database error";
                $result['message'] = mysqli_error($mysql);
            }
        }else{
            $resDB = mysqli_query($mysql, "SELECT * FROM users WHERE `id` = '" . $data['id'] . "'");
            if ($resDB != false){
                $result['result'] = 'Success';
                foreach($resDB as $row){
                    $result['items'][] = array("id" => $row['id'], "fullname" => $row['fullname']);
                }
            }
            else{
                $result['result'] = "Database error";
                $result['message'] = mysqli_error($mysql);
            }
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'POST'){
        $data = $_POST;
        if ($data['fullname'] != null){
            $resDB = mysqli_query($mysql, "INSERT INTO users(fullname) VALUES ('" . $data['fullname'] . "')");
            $result['result'] = $resDB;
        }else{
            $result['result'] = "Request error";
            $result['message'] = "Wrong passed data";
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'PUT'){
        parse_str(file_get_contents("php://input"),$data);
        if ($data['fullname'] != null && $data['id'] != null){
            $resDB = mysqli_query($mysql, "UPDATE users SET `fullname` = '" . $data['fullname'] . "' WHERE `id` = '" . $data['id'] . "'");
            $result['result'] = $resDB;
        }else{
            $result['result'] = "Request error";
            $result['message'] = "Wrong passed data";
        }
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'DELETE'){
        parse_str(file_get_contents("php://input"),$data);
        if ($data['id'] != null){
            $resDB = mysqli_query($mysql, "DELETE FROM users WHERE `id` = '" . $data['id'] . "'");
            $result['result'] = $resDB;
        }else{
            $result['result'] = "Request error";
            $result['message'] = "Wrong passed data";
        }
    }
}
else{
    $result['result'] = "Database error";
    $result['message'] = mysqli_error($mysql);
}

echo json_encode($result);