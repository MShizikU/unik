var dictAllowedDate = ["2023-19-21", "2023-19-20", "2023-19-19", "2023-19-13"];
var dictAllowedTime = {"2023-19-20" : ["14:30", "12:40"], "2023-19-21" : ["12:12", "13:41"], "2023-19-19": ["14:30", "12:31"], "2023-19-13" : ["21:40", "22:14"]};

var operation_accept_btn = document.querySelector(".op.form_button")
var date_time_accept_btn = document.querySelector(".dt.form_button")
var email_phone_accept_btn = document.querySelector(".ep.form_button")

var getMainTitle = document.querySelector("#booking_title")

var operation_selector = document.querySelector(".select-selected.option")
var date_selector = document.querySelector(".select-selected.date")
var time_selector = document.querySelector(".select-selected.time")
var email_field = document.querySelector("#email")
var phone_field = document.querySelector("#phone")

operation_accept_btn.addEventListener("click", function(event){
    if (operation_selector.innerHTML != 'Select an option'){
        if (getMainTitle){
            getMainTitle.classList.remove("error")
            getMainTitle.classList.add("ok")
            getMainTitle.innerHTML = "CREATE YOUR BOOKING"
        }
        setUpTimePicker(dictAllowedTime, dictAllowedDate)
        var choose_time_layout = document.querySelector(".dt.form_field_layout")
        if (choose_time_layout){
            if (choose_time_layout.classList.contains("disabled_layout")){
                choose_time_layout.classList.remove("disabled_layout")
            }
        }

        if (date_time_accept_btn){
            if (date_time_accept_btn.classList.contains("disabled_layout")){
                date_time_accept_btn.classList.remove("disabled_layout")
            }
        }
    }
    else{
        if (getMainTitle){
            getMainTitle.classList.remove("ok")
            getMainTitle.classList.add("error")
            getMainTitle.innerHTML = "Choose at least one operation"
        }
    }
})

date_time_accept_btn.addEventListener("click", function(event){
    if (date_selector.innerHTML != "Select a date" && time_selector.innerHTML != "Select a time" && time_selector.innerHTML != "Nothing is chosen"){
        if (getMainTitle){
            getMainTitle.classList.remove("error")
            getMainTitle.classList.add("ok")
            getMainTitle.innerHTML = "CREATE YOUR BOOKING"
        }
        var contacts_layout = document.querySelector(".ep.form_field_layout")
        if (contacts_layout){
            if (contacts_layout.classList.contains("disabled_layout")){
                contacts_layout.classList.remove("disabled_layout")
            }
        }

        if (true){
            if (email_phone_accept_btn.classList.contains("disabled_layout")){
                email_phone_accept_btn.classList.remove("disabled_layout")
            }
        }
    }else{
        if (getMainTitle){
            getMainTitle.classList.remove("ok")
            getMainTitle.classList.add("error")
            getMainTitle.innerHTML = "Chosen date or time is incorrect"
        }
    }
})

email_phone_accept_btn.addEventListener("click", function(event){
    if (email_field.value != "" && phone_field.value != ""){
        if (getMainTitle){
            getMainTitle.classList.remove("error")
            getMainTitle.classList.add("ok")
            getMainTitle.innerHTML = "CREATE YOUR BOOKING"
        }
        gapi.load('client', initClient)
    }
    else{
        if (getMainTitle){
            getMainTitle.classList.remove("ok")
            getMainTitle.classList.add("error")
            getMainTitle.innerHTML = "Something wrong with your email or phone number"
        }
    }
})

function initClient() {
    gapi.client.init({
        'apiKey': 'AIzaSyAlYmcfAgdvtqLqolXYyYMQdVbKqSXD07c',
        'discoveryDocs': ['https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest'],
        // clientId and scope are optional if auth is not required.
        'clientId': '287527149971-33pq36et6864tahdal13ki5sspdov4cq.apps.googleusercontent.com',
        'scope': 'https://www.googleapis.com/auth/calendar.events',
      }).then(function() {
        var event = {
            "summary": "Appointment",
            "location": "Somewhere",
            "start": {
              "dateTime": "2023-05-05T10:00:00.000-07:00"
            },
            "end": {
              "dateTime": "2023-05-06T10:25:00.000-07:00"
            }
          };
          var request = gapi.client.calendar.events.insert({
            'calendarId': 'primary',
            'resource': event
          });
          request.execute(function(event) {
            console.log('Event created: ' + event.htmlLink);
          });
      }).then(function(response) {
        console.log(response.result);
      }, function(reason) {
        console.log('Error: ' + reason.result.error.message);
      });
}