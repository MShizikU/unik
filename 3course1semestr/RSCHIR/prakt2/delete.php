<!DOCTYPE html>
<html>
<head>
    <title>Deletion Page</title>
</head>
<body>
<?php
session_start();
// Process form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $mysqli = new mysqli("db", "user", "password", "appDB");
    $result = $mysqli->query("DELETE FROM users WHERE `ID` = '$id'");
}
?>
<h1>Deletion Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Deletion</h2>
        <input type="number" name="id" placeholder="ID" required><br>
        <button type="submit" name="delete">Delete</button>
    </form>
</div>

</body>
</html>