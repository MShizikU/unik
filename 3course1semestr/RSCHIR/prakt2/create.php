<!DOCTYPE html>
<html>
<head>
    <title>Creation Page</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $surname = $_POST['surname'];

    $query = "INSERT INTO users (name, surname) VALUES ('$name', '$surname')";

    $mysqli = mysqli_connect("db", "user", "password", "appDB");
    if(mysqli_query($mysqli, $query)){
        header("Location: index.php");
    } else{
        echo "Ошибка: " . mysqli_error($mysqli);
    }
    mysqli_close($mysqli);   
}
?>
<h1>Creation Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Creation</h2>
        <input type="text" name="name" placeholder="Name" required><br>
        <input type="text" name="surname" placeholder="Surname" required><br>
        <button type="submit" name="create">Create</button>
    </form>
</div>

<div class = "button-container">
    <a href = "index.php">READ</a>
    <a href = "delete.php">DELETE</a>
    <a href = "update.php">UPDATE</a>
</div>

</body>
</html>