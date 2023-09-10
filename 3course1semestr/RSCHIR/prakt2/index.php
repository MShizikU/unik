<html lang="en">
<head>
    <title>Read page</title>
    <link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<h1>Таблица пользователей данного продукта</h1>
<table>
    <tr><th>Id</th><th>Name</th><th>Surname</th></tr>
<?php
$mysqli = mysqli_connect("db", "user", "password", "appDB");
$result = mysqli_query($mysqli, "SELECT * FROM users");
foreach ($result as $row){
    echo "<tr><td>{$row['ID']}</td><td>{$row['name']}</td><td>{$row['surname']}</td></tr>";
}
?>
</table>

<div class = "button-container">
    <a href = "update.php">UPDATE</a>
    <a href = "delete.php">DELETE</a>
    <a href = "create.php">CREATE</a>
</div>
</body>
</html>