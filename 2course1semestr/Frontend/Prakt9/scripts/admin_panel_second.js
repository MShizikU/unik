const btn_start_action_second = document.querySelector('.btn_second_task')

btn_start_action_second.addEventListener("click", () => {
    let login = prompt("Enter your login")
    if (login === "Admin") {
        let password = prompt("Enter password")
        if (password === "I am the head") {
            alert("Hello")
        } else {
            alert("Wrong password")
        }
    } else {
        alert("Exit")
    }
})