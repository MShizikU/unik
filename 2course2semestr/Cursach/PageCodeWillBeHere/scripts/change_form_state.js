const form_title = document.getElementsByClassName('form_title');

const elements = [...document.getElementsByClassName('disabled_form_field')].concat([...document.getElementsByClassName('enabled_form_field')])
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
                if(element.classList.contains('disabled_form_field')){
                    element.classList.add('enabled_form_field')
                    element.classList.remove('disabled_form_field')
                }else{
                    element.classList.remove('enabled_form_field')
                    element.classList.add('disabled_form_field')
                }
                
            })
            
        }
    })
})