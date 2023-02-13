let img = document.querySelector(".image_container img");
let imgBlock = document.querySelector(".image_container");

function imageToCenter(img) {
    img.style.marginLeft = (img.parentElement.clientWidth - img.clientWidth) / 2 + "px";
    img.style.marginTop =
        (img.parentElement.clientHeight - img.clientHeight) / 2 + "px";
}

imageToCenter(img);
