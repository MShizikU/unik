var login_btn = document.getElementById('login_button')
var form_wrapper = document.getElementsByClassName('form_wrapper')[0]
var basic_card_container = document.getElementsByClassName('basic_card_container')[0]

var form_wrapper = document.getElementById('reg_form_wrapper');
var cards_container = document.getElementById('main_cards_container')


document.addEventListener('click', function(e) {
    if (login_btn.contains(e.target)){
      form_wrapper.classList.add('enabled_wrapper');
      cards_container.classList.add('disabled_container')
    }
    else if (!form_wrapper.contains(e.target) && form_wrapper.classList.contains('enabled_wrapper')) {
      form_wrapper.classList.remove('enabled_wrapper');
      cards_container.classList.remove('disabled_container')
    }
  });