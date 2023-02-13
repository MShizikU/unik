let containers = document.querySelectorAll(".container");
for(let i = 0; i < containers.length; i++){
    let container = containers[i];
    container.onclick = function(event) {
        if (event.ctrlKey || event.metaKey) {
            toggleSelect(container);
        } else {
            singleSelect(container);
        }

    }

    container.onmousedown = function() {
        return false;
    }
}



function toggleSelect(container) {
    container.classList.toggle('selected');
}
function singleSelect(container) {
    let selected = document.querySelectorAll('.selected');
    for(let elem of selected) {
        elem.classList.remove('selected');
    }
    container.classList.add('selected');
}