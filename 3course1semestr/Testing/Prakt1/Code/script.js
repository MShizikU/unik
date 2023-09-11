const users = {};

users['admin'] = {
    username : 'admin',
    password : 'P@ssw0rd',
    balance : 1000
};

var isLogged = false;
var currentUserName = null;

function registerUser(event) {
    event.preventDefault(); 

    const registerForm = document.querySelector('form[name="register"]');
    const usernameInput = registerForm.querySelector('input[name="username"]');
    const passwordInput = registerForm.querySelector('input[name="password"]');

    
    const username = usernameInput.value;
    const password = passwordInput.value;

    
    if (users.hasOwnProperty(username)) {
        alert('Username already exists!');
        return;
    }

    isLogged = true;
    
    users[username] = {
        username: username,
        password: password,
        balance: 0
    };

    
    userLogged(username, password, 0);

    removeAllLogins();

    
    usernameInput.value = '';
    passwordInput.value = '';

    console.log('Registration successful:', users);
}

function loginUser(event) {
    event.preventDefault();

    
    const loginForm = document.querySelector('form[name="login"]');
    const usernameInput = loginForm.querySelector('input[name="username"]');
    const passwordInput = loginForm.querySelector('input[name="password"]');

    
    const username = usernameInput.value;
    const password = passwordInput.value;

    
    if (users.hasOwnProperty(username) && users[username].password === password) {
        alert('Login successful!');
        console.log('User logged in:', users[username]);

        userLogged(username, password, users[username]['balance']);

        removeAllLogins();
    } else {
        alert('Invalid username or password.');
    }
    
    usernameInput.value = '';
    passwordInput.value = '';
}

function addBalance(){
    event.preventDefault();
    const balanceForm = document.querySelector('form[name="balanceform"]');
    const balanceInput = balanceForm.querySelector('input[name="balance"]');

    users[currentUserName]['balance'] += balanceInput.value;

    const balanceField = document.querySelector("#balance-field");
    balanceField.innerHTML = "Balance: " + users[currentUserName]['balance'];

    balanceInput.value = '';
}

function changePassword(){
    event.preventDefault();
    const passwordForm = document.querySelector('form[name="change_password"]');
    const newPasswordInput = passwordForm.querySelector('input[name="newpassword"]');
    const oldPasswordInput = passwordForm.querySelector('input[name="oldpassword"]');

    if (users[currentUserName]['password'] === oldPasswordInput.value){
        users[currentUserName]['password'] = newPasswordInput.value;

        var passwordValue = "";
        for(var i = 0 ; i < users[currentUserName]['password'].length; i++){
            passwordValue += "*";
        }

        const passwordField = document.querySelector("#user_info .password");
        passwordField.querySelector(".password-value").innerHTML = "Password: " + passwordValue;

        newPasswordInput.value = "";
        oldPasswordInput.value = "";
    }
}

window.addEventListener('DOMContentLoaded', function() {
    
    const registerForm = document.querySelector('form[name="register"]');
    const loginForm = document.querySelector('form[name="login"]');
    const balanceForm = document.querySelector('form[name="balanceform"]');
    const changePasswordForm = document.querySelector('form[name="change_password"]');

    console.log(balanceForm);

    if (registerForm != null){
        registerForm.addEventListener('submit', registerUser);
    }

    if (loginForm != null){
        loginForm.addEventListener('submit', loginUser);
    }
    
    if (balanceForm != null){
        balanceForm.addEventListener('submit', addBalance);
    }

    if (changePasswordForm != null){
        changePasswordForm.addEventListener('submit', changePassword);
    }
});


function userLogged(username, password, balance){
    document.querySelector("#title").innerHTML = "ACCOUNT";
    currentUserName = username;

    const addBalanceBlock = document.getElementById('add-balance');
    addBalanceBlock.classList.toggle("hidden");

    const dataBlock = document.getElementById("user_info");
    dataBlock.classList.toggle("hidden");

    const userNameField = dataBlock.querySelector(".username");
    userNameField.innerHTML += username;

    var passwordValue = "";
    for(var i = 0 ; i < password.length; i++){
        passwordValue += "*";
    }

    const passwordField = dataBlock.querySelector(".password");
    passwordField.querySelector(".password-value").innerHTML += passwordValue;

    passwordField.querySelector(".change-password-link").addEventListener("click", () => {
        var passwordForm = document.getElementById("change_password_form");
        passwordForm.classList.toggle("hidden");
        
    });

    const balanceField = dataBlock.querySelector("#balance-field");
    balanceField.innerHTML += balance;
}

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

function reLocateToLesson(val){
    window.location = `lessons/lesson-${val}.html`;
}