var main_div = document.querySelector('main')


class Item_card {

    constructor(text, title, description, price, background, id) {
        this.text = text;
        this.title = title;
        this.description = description;
        this.price = price;
        this.background = background;
        this.id = id;
    }

}

clearCardsTable();

var bouquets = [];

bouquets.push(new Item_card("Розы - 8 шт.", "Поляна", "Разнообразные полевые цветы в сочетании с розами дарят ощущение лентей свободы и свежести.", 567, "images/bouquet_1.jpg", 1))
bouquets.push(new Item_card("Герберы и розы - 12 шт.", "Зонтик", "крупные бутоны гербер напоминают яркий зонтик защищающий Вас от всех невсгод и тяжестей жизни, наполняя её ярким видом и ароматом цветов.", 876, "images/bouquet_2.jpg", 2))
bouquets.push(new Item_card("Тюльпаны и розы - 23 шт. ", "Разнообразие", "Разнообразие тюльпанов и роз привнесут в Вашу жизнь много новых и ярких красок, а прекрассный аромат с легкостью наполнит всю комнату и дополнит внешний вид цветов.", 1234, "images/bouquet_3.jpg", 3))

array_to_Cards(bouquets, main_div.querySelector(".presents"))

var presents = []
presents.push(new Item_card("Конфеты - 15шт.", "Конфетный набор", "Самый лучший конфетный набор порадует любого человека. Нежный вкус шоколандых конфет растопит сердце любого человека.", 268, "images/present_1.jpg", 4))
presents.push(new Item_card("Конфеты + картина", "8 марта", "Лучший подарок на 8-ое марта. Прекрасные конфеты порадуют в этот день любого, а картина знаменитого автора Абрахенкова И.Г. будет греть душу еще долгое время.", 1235, "images/present_2.jpg", 5))
presents.push(new Item_card("Зимние фрукты + новогодние игрушки", "Зимний", "В зимнее время у каждого из нас есть желание погрузится в тамосферу нового года: поесть сладких мандаринов, нарядить новогоднюю елку и получить подарок. Теперь у Вас есть возможность погрузится в эту атмосферу в любое время года.", 567, "images/present_3.jpg", 6))

array_to_Cards(presents, main_div.querySelector(".flowers"))

var flowers = []
flowers.push(new Item_card("Филипины", "Розы", "Прекрасные розы с полей Филипин будут радовать Ваш глаз незабываемо долго, а запаха останется в Вашей памяти навечно.", 125, "images/flower_1.jpg", 7))
flowers.push(new Item_card("Польша", "Тюльпаны", "Стойкие тюльпаны - это отличный подарок на любой праздник.", 80, "images/flower_2.jpg", 8))
flowers.push(new Item_card("Финляндия", "Ромашки", "Ромашки - лучшие полевые цветы с прекрасным запахом и отличным видом.", 70, "images/flower_3.jpg", 9))

array_to_Cards(flowers, main_div.querySelector("footer"))


function array_to_Cards(items, insert_after) {


    for (i = 0; i < items.length; i++) {
        itemToCard(items[i], insert_after)
    }
}

function itemToCard(item, insert_after) {

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

    tmp_button.addEventListener("click", () => {
        document.location = encodeURI("info_item.html?title=" + item.title + "&text=" + item.text + "&imgsrc=" + item.background + "&description=" + item.description + "&price=" + item.price);
    })

    let tmp_heart = document.createElement("button")
    tmp_heart.type = "button"
    tmp_heart.classList.add("like")

    tmp_heart.addEventListener("click", () => {
        let i = tmp_heart.querySelector("i")
        if (i.classList.contains('white_heart')) {
            i.classList.remove('white_heart')
            i.classList.add('red_heart')
        }
        else {
            i.classList.add('white_heart')
            i.classList.remove('red_heart')
        }
    })


    let tmp_heart_icon = document.createElement("i")
    tmp_heart_icon.classList.add("fa-regular")
    tmp_heart_icon.classList.add("fa-heart")
    tmp_heart_icon.classList.add("white_heart")

    tmp_heart.appendChild(tmp_heart_icon)

    tmp_content.appendChild(tmp_button)
    tmp_content.appendChild(tmp_heart)
    main_div.insertBefore(tmp_container, insert_after)

    style.innerHTML += `#flower_card_${item.id} .box:before, #flower_card_${item.id} .box:after {background-image: url(${item.background});}`

    document.head.appendChild(style)

}

function clearCardsTable() {
    let containers = main_div.querySelectorAll('.container')

    containers.forEach(item => {
        main_div.removeChild(item)
    })
}