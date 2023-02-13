var main_div = document.querySelector('main')

class Item_card {

    constructor(text, title,description, price, background, id){
        this.text = text;
        this.title = title;
        this.description = description;
        this.price = price;
        this.background = background;
        this.id = id;
    }

}

var items = []
items.push(new Item_card("Филипины", "Розы", "Прекрасные розы с полей Филипин будут радовать Ваш глаз незабываемо долго, а запах останется в Вашей памяти навечно.", 125, "images/flower_1.jpg", 1))
items.push(new Item_card("Польша", "Тюльпаны", "Стойкие тюльпаны - это отличный подарок на любой праздник.", 80, "images/flower_2.jpg", 2))
items.push(new Item_card("Финляндия", "Ромашки", "Ромашки - лучшие полевые цветы с прекрасным запахом и отличным видом.", 70, "images/flower_3.jpg", 3))
items.push(new Item_card("Аргентина", "Хризантемы", "Величественные хризантемы - это идеальное украшение жизни привносящее в нее яркий цвет и аромат.", 180, "images/flower_4.jpg", 4))
items.push(new Item_card("Россия", "Герберы", "Герберы - любимые цветы множества людей приносящих радость и красоту в каждый дом.", 100, "images/flower_5.jpg", 5))

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
            let hearts = document.querySelectorAll('.red_heart');
            hearts.forEach(item => {
                item.classList.add('white_heart');
                item.classList.remove('red_heart');
            })
            i.classList.remove('white_heart')
            i.classList.add('red_heart')
            let largeimg = document.querySelector(".largeimg");
            largeimg.src = item.background;
        }
        else {
            i.classList.add('white_heart')
            i.classList.remove('red_heart')
            let largeimg = document.querySelector(".largeimg");
            largeimg.src = "images/our_team.jpg";
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