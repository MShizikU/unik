var main_div = document.querySelector('main')

class Item_card {

    text = "aboba"

    constructor(text, title, price, background, id){
        this.text = text;
        this.title = title;
        this.price = price;
        this.background = background;
        this.id = id;
    }


    get Text()  {
        return this.text;
    }


}

var items = []
items.push(new Item_card("Филипины", "Розы", 268, "images/flowers_garden.png", 1))
items.push(new Item_card("Польша", "Ромашки", 577, "images/flowers_garden.png", 2))
items.push(new Item_card("Финляндия", "Гладиолусы", 122, "images/flowers_garden.png", 1))
items.push(new Item_card("Аргентина", "Гиацинты", 311, "images/flowers_garden.png", 2))
items.push(new Item_card("Россия", "Тюльпаны", 468, "images/flowers_garden.png", 1))
items.push(new Item_card("Беларусь", "Хризантемы", 999, "images/flowers_garden.png", 2))

array_to_Cards(items)

function array_to_Cards(items) {

    

    clearCardsTable()

    for(i = 0; i < items.length; i++){
        itemToCard(items[i])
    }


}

function itemToCard(item){

    var style = document.createElement('style')

    let tmp_container = document.createElement("div")
    tmp_container.classList.add("container")
    tmp_container.id = `flower_card_${item.id}`

    let tmp_box = document.createElement("div")
    tmp_box.classList.add("box")
    tmp_container.appendChild(tmp_box)

    let tmp_content = document.createElement("div")
    tmp_content.classList.add("content")
    tmp_box.appendChild(tmp_content)

    let tmp_title = document.createElement("h2")
    tmp_title.innerHTML = item.title

    let tmp_text = document.createElement("p")
    tmp_text.innerHTML = item.text

    let tmp_price = document.createElement("p")
    tmp_price.innerHTML = item.price + " руб."

    tmp_content.appendChild(tmp_title)
    tmp_content.appendChild(tmp_text)
    tmp_content.appendChild(tmp_price)


    let tmp_button = document.createElement("a")
    tmp_button.innerHTML = "Подробнее"
    tmp_button.classList.add("btn_more")

    let tmp_heart = document.createElement("button")
    tmp_heart.type = "button"
    tmp_heart.classList.add("like")

    tmp_heart.addEventListener("click", () => {
        let i = tmp_heart.querySelector("i")
        if (i.classList.contains('white_heart')) {
            i.classList.remove('white_heart')
            i.classList.add('red_heart')
            body.addEventListener('mousemove', drawHeartOnPos);
        }
        else {
            i.classList.add('white_heart')
            i.classList.remove('red_heart')
            body.removeEventListener('mousemove', drawHeartOnPos);
        }
    })
    

    let tmp_heart_icon = document.createElement("i")
    tmp_heart_icon.classList.add("fa-regular")
    tmp_heart_icon.classList.add("fa-heart")
    tmp_heart_icon.classList.add("white_heart")

    tmp_heart.appendChild(tmp_heart_icon)

    tmp_content.appendChild(tmp_button)
    tmp_content.appendChild(tmp_heart)
    main_div.insertBefore (tmp_container, main_div.firstChild)

    style.innerHTML += `#flower_card_${item.id} .box:before, #flower_card_${item.id} .box:after {background-image: url(${item.background});}`

    document.head.appendChild(style)
    
}

function clearCardsTable(){
    let containers = main_div.querySelectorAll('.container')

    containers.forEach(item => {
        main_div.removeChild(item)
    })
}