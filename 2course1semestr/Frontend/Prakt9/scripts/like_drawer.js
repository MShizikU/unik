
function drawHeartOnPos(event) {
    var heart = document.createElement('i')
    heart.className = 'fa-regular fa-heart red_heart'
    heart.style.position = "absolute";
    heart.style.top = (event.pageY - 10) + "px";
    heart.style.left = (event.pageX + 10) + "px"
    document.body.append(heart);
    setTimeout(function () {
        document.body.removeChild(heart);
    }, 500);
}