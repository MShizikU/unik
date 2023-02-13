document.querySelector("#mainButton").onclick = function animateButton() {
    let mainText = document.querySelector("#mainText")
    animateText(mainText)
}
function animateText(textArea) {
    let text = textArea.value;
    let to = text.length, from = 0;
    animate({
        duration: 5000,
        timing: bounce,
        draw: function (progress) {
            let result = (to - from) * progress + from;
            textArea.value = text.slice(0, Math.ceil(result))
        }
    });
}
function bounce(timeFraction) {
    for (let a = 0, b = 1; ; a += b, b /= 2) {
        if (timeFraction >= (7 - 4 * a) / 11) {
            return -Math.pow((11 - 6 * a - 11 * timeFraction) / 4, 2) + Math.pow(b, 2)
        }
    }
}
function animate(options) {
    var start = performance.now();
    requestAnimationFrame(function animate(time) {
        var timeFraction = (time - start) / options.duration;
        if (timeFraction > 1) timeFraction = 1;
        var progress = options.timing(timeFraction)
        options.draw(progress);
        if (timeFraction < 1) {
            requestAnimationFrame(animate);
        }
    });
}