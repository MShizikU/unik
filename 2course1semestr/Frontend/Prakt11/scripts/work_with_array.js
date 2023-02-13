


var btn_change = document.getElementById("change_element")
var btn_remove = document.getElementById("delete_element")
var btn_filter = document.getElementById("filter_array")
var btn_sort = document.getElementById("sort_array")


var count = 0;


btn_change.addEventListener("click", () => {
    clearCardsTable()
    if (items.length <  1 ) return
    items[1] = items.splice(0,1, items[1])[0]
    itemToCard(items[0])
})

btn_remove.addEventListener("click", () => {
    clearCardsTable()
    items.shift()
    array_to_Cards(items)
})


btn_filter.addEventListener("click", () => {
    let a = prompt("Enter from number for filter")
    let b = prompt("Enter to number for filter")
    let res_array = filterArray(items, a, b)
    array_to_Cards(res_array)
})

btn_sort.addEventListener("click", () =>{
    count++;

    
    clearCardsTable()
    let res_array

    if (count % 2 == 0) res_array = items.sort((a,b) => a.price - b.price)
    else res_array = items.sort((a,b) => b.price - a.price)

    array_to_Cards(res_array)
})


function filterArray(list_of_cards, from, to){
    return list_of_cards.filter(item => item.price > from && item.price < to )
}

function swap(item1, item2){
    let itemtmp = item2
    item2 = item1
    item1 = itemtmp
}

function compareItems(itemFirst, itemSecond){
    if (itemFirst.price > itemSecond.price) return 1
    if (itemFirst.price === itemSecond.price) return 0
    if (itemFirst.price  < itemSecond.price) return -1
}