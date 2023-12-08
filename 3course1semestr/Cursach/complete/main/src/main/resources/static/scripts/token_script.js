document.addEventListener('DOMContentLoaded', function () {
        var savedToken = localStorage.getItem('userToken');

        if (savedToken) {
            var allLinks = document.querySelectorAll('a');
            allLinks.forEach(function (link) {
                var currentHref = link.getAttribute('href');
                link.setAttribute('href', currentHref + (currentHref.includes('?') ? '&' : '?') + 'token=' + encodeURIComponent(savedToken));
            });
        }
    });