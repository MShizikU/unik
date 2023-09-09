<!DOCTYPE html>
<html>
<head>
    <title>Update Page</title>
</head>
<body>
<?php
session_start();
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $mysqli = new mysqli("db", "user", "password", "appDB");
    $result = $mysqli->query("");
}
?>
<h1>Creation Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Creation</h2>
        <input type="number" name="id" placeholder="ID" required><br>
        <input type="text" name="name" placeholder="Name" required><br>
        <input type="text" name="surnmae" placeholder="Surname" required><br>
        <button type="submit" name="update">Update</button>
    </form>
</div>

</body>
</html>