var search_input = document.querySelectorAll('.search_bar');


for(let i = 0; i < search_input.length; i++){
    let input = search_input[i]
    if(input.offsetHeight !== 0 && input.offsetHeight !==0){
        console.log(input)
        search_input = input.querySelector('input');
        
        break;
    }
}

search_input.addEventListener('keydown', function(e){

    if(e.keyCode === 13){
        search_holder(search_input.value)
    }
})

search_input.addEventListener('keydown', function(e){

    if(e.keyCode === 46 || e.keyCode === 8){
        array_to_Cards(items)
    }
})


function search_holder(text){
    let  tmp_arr = [];
    items.forEach(element => {
        if(check_card(text, element)){
            tmp_arr.push(element);
        }
    });
    console.log(tmp_arr)
    array_to_Cards(tmp_arr)
}


function check_card(text, card){
    return card.text.toLowerCase().includes(text.toLowerCase()) || card.description.toLowerCase().includes(text.toLowerCase()) || card.title.toLowerCase().includes(text.toLowerCase());
}