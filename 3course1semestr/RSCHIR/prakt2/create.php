<!DOCTYPE html>
<html>
<head>
    <title>Creation Page</title>
</head>
<body>
<?php
session_start();
// Process form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $mysqli = new mysqli("db", "user", "password", "appDB");
    $result = $mysqli->query("INSERT INTO users('name', 'surname') VALUES ('$name', '$surname')");
}
?>
<h1>Creation Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Creation</h2>
        <input type="text" name="name" placeholder="Name" required><br>
        <input type="text" name="surnmae" placeholder="Surname" required><br>
        <button type="submit" name="create">Create</button>
    </form>
</div>

</body>
</html>