var notification_number = document.querySelector(".notification_number")
var notification_text = document.querySelector(".notification_text")

var counter = 1;


function changeNotification(checker){
    notification_number.innerHTML = counter++
    notification_text.innerHTML = "Уведомление"
}

function notificationDecorator(func){

    return function(checker){
        
        if(checker === 1){
            
            clearInterval(intervalId)
            setTimeout(function(){
                func
                intervalId = setInterval(changeNotification, 3000, 0)
            }, 10000, checker)

            
        }
        else   
            func.call(checker)

        if (counter > 20) counter = 0


    };
}



var intervalId  = setInterval(changeNotification,3000, 0)

changeNotification = notificationDecorator(changeNotification)

var btn_stop_notification = document.querySelector(".stop")

btn_stop_notification.addEventListener("click", () =>{
    changeNotification(1)
})
