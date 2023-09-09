<!DOCTYPE html>
<html>
<head>
    <title>Authorization Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }

        .form-container {
            display: inline-block;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<?php
session_start();
if (isset($_SESSION['balance']) && isset($_SESSION['username']) && isset($_SESSION['isLogged']) && $_SESSION['isLogged'] == true) {
    $username = $_SESSION['username'];
    $balance = $_SESSION['balance'];
    echo "<h1>Welcome to our design course, $username</h1>";
    echo "<h2>Your current balance is</h2>";
    echo "<h2 id = 'balance_res'>$balance</h2>";
    echo "<input type='text' placeholder='Enter payment information' id = 'balance_input_field'>";
    echo "<button onClick = 'addBalance()'>Add Payment</button>";
    echo '<script type="text/javascript">
        removeAllLogins();
    </script>';
    exit();
}else if (isset($_SESSION['balance']) && isset($_SESSION['username']) && isset($_SESSION['isLogged'])){
    echo "<h1>You are not welcomed</h1>";
    echo '<script type="text/javascript">
        wakeUpLogins();
    </script>';
}

// Process form submissions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Connect to MySQL database
    $db_host = 'localhost';
    $db_user = 'test@localhost';
    $db_password = '123321';
    $db_name = 'db';

    $conn = mysqli_connect($db_host, $db_user, $db_password, $db_name);
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // Handle registration form submission
    if (isset($_POST['register'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $username = mysqli_real_escape_string($connection, $username);
        $password = mysqli_real_escape_string($connection, $password);
        $balance = random_int(0, 1000);

        $hashedPassword = hash('sha256', $password);

        $query = "SELECT * FROM users WHERE username = '$username' AND password = '$hashedPassword'";
        $result = mysqli_query($connection, $query);

        if (mysqli_num_rows($result) == 0) {
            $query = "INSERT INTO users (username, password, balance ) VALUES ('$username', '$hashedPassword', '$balance')";
        } else {
            if (mysqli_query($connection, $query)) {
                $_SESSION['isLogged'] = true;
            } else {
                $_SESSION['isLogged'] = false;
            }
        }

        $_SESSION['username'] = $username;
        $_SESSION['balance'] = $balance;
        
        header("Location: index.php");
        exit();
    }
    if (isset($_POST['login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];


        $username = mysqli_real_escape_string($connection, $username);
        $password = mysqli_real_escape_string($connection, $password);

        $hashedPassword = hash('sha256', $password);

        $query = "SELECT * FROM users WHERE username = '$username' AND password = '$hashedPassword'";
        $result = mysqli_query($connection, $query);

        if (mysqli_num_rows($result) == 1) {
            $_SESSION['isLogged'] = true;
            $_SESSION['balance'] = $result[0]['balance'];
        } else {
            $_SESSION['isLogged'] = false;
        }

        $_SESSION['username'] = $username;
        header("Location: index.php");
        exit();
    }
}
?>
<h1>Authorization Page</h1>
<div class="form-container">
    <form method="POST">
        <h2>Registration</h2>
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit" name="register">Register</button>
    </form>
    <button onclick="toggleForms()">Switch to Login</button>
</div>
<div class="form-container hidden">
    <form method="POST">
        <h2>Login</h2>
        <input type="text" name="username" placeholder="Username" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit" name="login">Login</button>
    </form>
    <button onclick="toggleForms()">Switch to Registration</button>
</div>

<script>
    function toggleForms() {
        var forms = document.getElementsByClassName("form-container");
        forms[0].classList.toggle("hidden");
        forms[1].classList.toggle("hidden");
    }

    function removeAllLogins() {
        var forms = document.getElementsByClassName("form-container");
        forms[0].classList.add("hidden");
        forms[1].classList.add("hidden");
    }

    function wakeUpLogins(){
        var forms = document.getElementsByClassName("form-container");
        forms[0].classList.remove("hidden"); 
        forms[1].classList.add("hidden");
    }

    function addBalance(){
        var balanceField = document.querySelector("#balance_input_field");
        var balanceRes = document.querySeletor("#balance_res");

        balanceRes.innerHTML = balanceRes.innerHTML + balanceField.value;
    }
</script>

</body>
</html>