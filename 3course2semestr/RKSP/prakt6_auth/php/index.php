<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

$users = [
    'user1' => 'password1',
    'user2' => 'password2',
];

$postData = file_get_contents("php://input");
$request = json_decode($postData);

$username = $request->username;
$password = $request->password;

if (array_key_exists($username, $users) && $users[$username] === $password) {
    $response = ['status' => 'success', 'message' => 'User authenticated'];
} else {
    $response = ['status' => 'error', 'message' => 'Invalid username or password'];
}

header('Content-Type: application/json');
echo json_encode($response);
