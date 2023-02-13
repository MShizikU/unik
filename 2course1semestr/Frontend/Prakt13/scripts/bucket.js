let currentDroppable = null;


document.onmousedown = function(event) {
    let flower = event.target.closest('.box');
    if (flower === null) return
    let shiftX = event.clientX - flower.getBoundingClientRect().left;
    let shiftY = event.clientY - flower.getBoundingClientRect().top;
    flower.style.position = 'absolute';
    flower.style.zIndex = 1;
    moveAt(event.pageX, event.pageY);
    function moveAt(pageX, pageY) {
        flower.style.left = pageX - shiftX + 'px';
        flower.style.top = pageY - shiftY + 'px';
    }
    function onMouseMove(event) {
        moveAt(event.pageX, event.pageY);
        flower.hidden = true;
        let elemBelow = document.elementFromPoint(event.clientX, event.clientY);
        
        flower.hidden = false;
        if (!elemBelow) return;
        let droppableBelow = elemBelow.closest('.droppable');

        if (currentDroppable != droppableBelow) {
            currentDroppable = droppableBelow;
            if (currentDroppable) {
                if(!flower)
                    return;
                enterDroppable(flower);
            }
        }
    }
    document.addEventListener('mousemove', onMouseMove);
    flower.onmouseup = function() {
        document.removeEventListener('mousemove', onMouseMove);
        flower.onmouseup = null;
        flower.remove();
    };
};

let addsSum = document.querySelector(".sum");
let priceSum = 0;
function enterDroppable(flower) {
    flower.remove();
    let text = String(flower.querySelectorAll("p")[1].innerHTML);
    let price = Number(text.split(" ")[0]);
    console.log(text + ' ' + price)
    priceSum += price;
    addsSum.innerHTML = `Сумма: ${priceSum}`;
    price = 0;
}

document.ondragstart = function() {
    return false;
};