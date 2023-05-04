var dictAllowedDates = ["2023-19-20", "2023-19-20", "2023-19-20", "2023-19-20"];
var dictAllowedTime = ["14:00", "15:00", "16:30"];

addItemsToSelector(dictAllowedDates, "#date_items", 'date')
addItemsToSelector(dictAllowedTime, "#time_items", 'time')

setUpEventListeners("date");
setUpEventListeners("time")


function setUpEventListeners(prefix){
  var selectItems = document.querySelectorAll(".select-item." + prefix);

  var select = document.querySelector(".custom-select." + prefix);
  var selectSelected = select.querySelector(".select-selected." + prefix);
  var selectItemsContainer = select.querySelector("#" + prefix + "_items");

  selectSelected.addEventListener("click", function() {
    selectItemsContainer.classList.toggle("select-hide");
  });

  selectItems.forEach(function(item) {
    item.addEventListener("click", function() {
      var text = item.innerHTML;
      selectSelected.innerHTML = text;
    });
  });

  document.addEventListener("click", function(e) {
    if (!select.contains(e.target)) {
      selectItemsContainer.classList.add("select-hide");
    }
  });
}

function addItemsToSelector(items, selector, param) {
    var select = document.querySelector(selector);
    if (select) {
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