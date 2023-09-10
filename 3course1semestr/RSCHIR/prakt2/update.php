<!DOCTYPE html>
<html>
<head>
    <title>Update Page</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $surname = $_POST['surname'];

    
    $mysqli = mysqli_connect("db", "user", "password", "appDB");
    if ($id != null && $name != null){
        $query = "UPDATE users SET name = '$name' WHERE id = $id";
        if (!mysqli_query($mysqli, $query )){
            echo "Ошибка: " . mysqli_error($mysqli);
            echo "Request: " . $query;
        }
    }

    if ($id != null && $surname != null){
        $query = "UPDATE users SET surname = '$surname' WHERE id = $id";
        if (!mysqli_query($mysqli, $query)){
            echo "Ошибка: " . mysqli_error($mysqli);
            echo "Request: " . $query;
        }
    }
    mysqli_close($mysqli);
}
?>
<h1>Creation Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Creation</h2>
        <input type="number" name="id" placeholder="ID" required><br>
        <input type="text" name="name" placeholder="Name"><br>
        <input type="text" name="surname" placeholder="Surname"><br>
        <button type="submit" name="update">Update</button>
    </form>
</div>

<div class = "button-container">
    <a href = "index.php">READ</a>
    <a href = "delete.php">DELETE</a>
    <a href = "create.php">CREATE</a>
</div>

</body>
</html>