<?php
// Get the JSON data from the request body
$data = $_POST['params'];


// Make sure the data was successfully decoded


http_response_code(200);
header('Content-Type: application/json');
foreach ($_POST as $element) {
    echo $element . "\n"; // Or use <br /> if displaying in HTML
}
?>
