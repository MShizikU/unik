<!DOCTYPE html>
<html>
<head>
    <title>Deletion Page</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];

    $query = "DELETE FROM users WHERE id = '$id'";

    $mysqli = mysqli_connect("db", "user", "password", "appDB");

    if(mysqli_query($mysqli, $query)){
        header("Location: index.php");
    } else{
        echo "Ошибка: " . mysqli_error($mysqli);
    }
    mysqli_close($mysqli);   
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

<div class = "button-container">
    <a href = "index.php">READ</a>
    <a href = "update.php">UPDATE</a>
    <a href = "create.php">CREATE</a>
</div>

</body>
</html>