document.querySelector('#book_time_link').addEventListener( 'click', function(){
    elements = document.querySelectorAll('.disabled_layout');
    [...elements].forEach(function(element) {
        element.classList.remove('disabled_layout')
    })
})