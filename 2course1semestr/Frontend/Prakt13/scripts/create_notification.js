


let notifSection = document.querySelector(".notification_block");

var count = 1;

notifSection.onclick = function(event){
    let notification = event.target.closest(".close_btn");
    if (!notification) return;
    notification.parentElement.remove();
}



function showNotification() {
    let div = document.createElement("div");
    div.className = "notification_body";

    notifNumber = document.createElement("div");
    notifNumber.className = "notification_number";
    notifNumber.innerHTML = count++;

    notifText = document.createElement("div");
    notifText.className = "notification_text";
    notifText.innerHTML = "Уведомление";

    div.appendChild(notifText);
    div.appendChild(notifNumber);
    

    notifSection.appendChild(div);

    let closeBtn = document.createElement("button");
    closeBtn.innerHTML = "X";
    closeBtn.className = "close_btn";
    div.append(closeBtn);
    setTimeout(function () {
        div.remove();
    }, 7500);
    
}

document.getElementById("show_notification").addEventListener("click" , () => {
    showNotification();
})
