
document.getElementById("create_li").addEventListener("click", () => {

    newLi();
})

function newLi() {
    let b = document.querySelector(".list")
    while (true) {
        let data = prompt("Введите текст для элемента списка", "");
        if (data == "" || data == null) {
            break;
        }
        let li = document.createElement('li');
        li.textContent = data + "";
     b.appendChild(li);
    }
}