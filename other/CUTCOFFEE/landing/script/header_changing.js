header_links = document.querySelectorAll('.nav_link');

[...header_links].forEach(function(element) {
    element.addEventListener('click', function(){
        active_element = document.querySelector('.active')
        active_element.classList.remove('active')
        element.parentElement.classList.add('active')
    })
})