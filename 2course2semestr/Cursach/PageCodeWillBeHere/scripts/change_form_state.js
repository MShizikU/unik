const form_title = document.getElementsByClassName('form_title');

const elements = [...document.getElementsByClassName('enabled')].concat([...document.getElementsByClassName('disabled')])
const btn = document.getElementsByClassName('form_submit_button')[0]
console.log(elements)

console.log(form_title);
[...form_title].forEach(function(title) {
    title.addEventListener('click', function(){
        
        if(window.getComputedStyle(title).getPropertyValue('order') === '2'){
            if (btn.innerHTML =='Регистрация'){
                btn.innerHTML = 'Вход'
            }
            else{
                btn.innerHTML = 'Регистрация'
            }
            active_title = document.querySelector('.active')
            active_title.classList.remove('active')
            active_title.classList.add('inactive')
            title.classList.add('active')
            title.classList.remove('inactive');
            [...elements].forEach(function(element){
                console.log(element.classList)
                if(element.classList.contains('disabled')){
                    element.classList.add('enabled')
                    element.classList.remove('disabled')
                }else{
                    element.classList.remove('enabled')
                    element.classList.add('disabled')
                }
                
            })
            
        }
    })
})