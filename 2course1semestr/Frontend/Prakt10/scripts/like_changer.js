

const body = document.querySelector('.container')


document.querySelectorAll('.like').forEach(item => { 
    let i = item.querySelector('.fa-heart')
    item.addEventListener("click", () => {
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
})