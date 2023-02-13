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
