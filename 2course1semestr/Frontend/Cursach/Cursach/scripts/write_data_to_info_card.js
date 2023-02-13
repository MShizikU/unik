class Item_card {


    constructor(text, title, description, price, background) {
        this.text = text;
        this.title = title;
        this.description = description;
        this.price = price;
        this.background = background;
    }

}

var item = onLoad();

writeToCard(item);

function onLoad() {
    let params = decodeURI(window.location.href).split("?")[1].split("&");
    return new Item_card(params[1].split("=")[1], params[0].split("=")[1], params[3].split("=")[1], params[4].split("=")[1], params[2].split("=")[1])
}



function writeToCard(cur_item) {
    let image_container = document.querySelector(".image_container");
    image_container.style.backgroundImage = "url(" + cur_item.background + ")";

    let title = document.querySelector(".title_container").querySelector("h2");
    title.innerHTML = cur_item.title;

    let description = document.querySelector(".description_container p");
    description.innerHTML = cur_item.description;

    let price = document.querySelector(".price p")
    price.innerHTML = cur_item.price;


}