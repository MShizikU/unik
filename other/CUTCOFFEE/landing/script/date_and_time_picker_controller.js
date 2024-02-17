

function setUpTimePicker(dictAllowedTime, dictAllowedDate){
  addItemsToSelector(dictAllowedDate, "#date_items", 'date')
  var selectItemsDate = document.querySelectorAll(".select-item.date");

  var selectDate = document.querySelector(".custom-select.date" );
  var selectSelected = selectDate.querySelector(".select-selected.date");
  var selectItemsContainer = selectDate.querySelector("#date_items");

  selectSelected.innerHTML = "Select a date"
  document.querySelector(".select-selected.time").innerHTML = "Nothing is chosen"

  selectSelected.addEventListener("click", function() {
    selectItemsContainer.classList.toggle("select-hide");
  });

  selectItemsDate.forEach(function(item) {
    item.addEventListener("click", function() {
      var text = item.innerHTML;
      selectSelected.innerHTML = text;
      unlockTimePicker(dictAllowedTime[item.innerHTML]);
      selectItemsContainer.classList.add("select-hide");
    });
  });

  document.addEventListener("click", function(e) {
    if (!selectDate.contains(e.target)) {
      selectItemsContainer.classList.add("select-hide");
    }
  });
}




function addItemsToSelector(items, selector, param) {
    var select = document.querySelector(selector);
    if (select) {
      while (select.firstChild) {
        select.removeChild(select.firstChild);
      }
      for (var i = 0; i < items.length; i++) {
        var itemDiv = document.createElement('div');
        itemDiv.className = param + ' select-item';
        itemDiv.innerHTML = items[i];
        select.appendChild(itemDiv);
      }
    } else {
      console.error('Selector not found:', selector);
    }
  }

function unlockTimePicker(dictAllowedTimes){
  console.log(dictAllowedTimes)
  addItemsToSelector(dictAllowedTimes, "#time_items", 'time')
  var selectItemsTime = document.querySelectorAll(".select-item.time");

  var selectTime = document.querySelector(".custom-select.time" );
  var selectSelectedTime = selectTime.querySelector(".select-selected.time");
  var selectItemsContainer = selectTime.querySelector("#time_items");

  selectSelectedTime.innerHTML = "Select a time"

  selectSelectedTime.addEventListener("click", function() {
    if (document.querySelector(".select-selected.date").innerHTML != "Select a date"){
      selectItemsContainer.classList.remove("select-hide");
    }
  });

  selectItemsTime.forEach(function(item) {
    item.addEventListener("click", function() {
      var text = item.innerHTML;
      selectSelectedTime.innerHTML = text;
      selectItemsContainer.classList.add("select-hide");
    });
  });

  document.addEventListener("click", function(e) {
    if (!selectTime.contains(e.target)) {
      selectItemsContainer.classList.add("select-hide");
    }
  });
}