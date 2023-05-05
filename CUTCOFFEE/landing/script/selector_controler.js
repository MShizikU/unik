var dictOptionsWithLength = {"option 1" : 2, "option 3" : 3}
var dictAllOptions = Object.keys(dictOptionsWithLength)

var dictSelectedOptions = [];

addItemsToSelector(dictAllOptions, "#options_items")

var selectItems = document.querySelectorAll(".select-item");

var select = document.querySelector(".custom-select.option");
var selectSelected = select.querySelector(".select-selected.option");
var selectItemsContainer = select.querySelector("#options_items");
var timeShower = document.querySelector("#time_shower")

selectSelected.addEventListener("click", function() {
  selectItemsContainer.classList.toggle("select-hide");
});

selectItems.forEach(function(item) {
  item.addEventListener("click", function() {
    if (item.classList.contains('active')){
        item.classList.remove('active')
        item.classList.add('unactive')
        var index = dictSelectedOptions.indexOf(item.innerHTML);
        if (index !== -1) {
            dictSelectedOptions.splice(index, 1);
        }
    }
    else{
        item.classList.add('active')
        item.classList.remove('unactive')
        dictSelectedOptions.push(item.innerHTML)
    }
    var text = createText(dictSelectedOptions);
    var time = calculateTotalTime(dictSelectedOptions, dictOptionsWithLength)
    if (text === ""){
        text = "Select an option"
        time = "Nothing was chosen"
    }
    timeShower.innerHTML = time;
    selectSelected.innerHTML = text;
  });
});

document.addEventListener("click", function(e) {
  if (!select.contains(e.target)) {
    selectItemsContainer.classList.add("select-hide");
  }
});


function createText(listOfOperations){
    return listOfOperations.join(', ')
}

function calculateTotalTime(listOfSelectedOperations, listOfOptionsWithTime){
    var totalMinutes = 0;
    for (var i = 0; i < listOfSelectedOperations.length; i++) {
      var optionName = listOfSelectedOperations[i];
      var optionTime = listOfOptionsWithTime[optionName];
      if (optionTime) {
        totalMinutes += optionTime * 60;
      }
    }
    var hours = Math.floor(totalMinutes / 60);
    var minutes = totalMinutes % 60;
    var timeString = hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0');
    return timeString
}

function addItemsToSelector(items, selector) {
    var select = document.querySelector(selector);
    if (select) {
      for (var i = 0; i < items.length; i++) {
        var itemDiv = document.createElement('div');
        itemDiv.className = 'option select-item unactive';
        itemDiv.innerHTML = items[i];
        select.appendChild(itemDiv);
      }
    } else {
      console.error('Selector not found:', selector);
    }
  }