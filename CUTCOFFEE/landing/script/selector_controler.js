
var selectItems = document.querySelectorAll(".select-item");

var select = document.querySelector(".custom-select");
var selectSelected = select.querySelector(".select-selected");
var selectItemsContainer = select.querySelector(".select-items");

selectSelected.addEventListener("click", function() {
  selectItemsContainer.classList.toggle("select-hide");
});

selectItems.forEach(function(item) {
  item.addEventListener("click", function() {
    if (item.classList.contains('active')){

    }
    var text = this.innerHTML;

    selectSelected.innerHTML = text;

    selectItemsContainer.classList.add("select-hide");
  });
});

document.addEventListener("click", function(e) {
  if (!select.contains(e.target)) {
    selectItemsContainer.classList.add("select-hide");
  }
});