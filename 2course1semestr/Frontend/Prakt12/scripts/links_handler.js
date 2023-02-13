let footerLink = document.querySelector(".outlinks")
log(footerLink)
footerLink.onclick = function(event) {
    function handleLink() {
        let isLeaving = confirm(`Покинуть страницу?`);
        if (!isLeaving) return false;
    }
    let target = event.target.closest('a');
    if (target && footerLink.contains(target)) {
        return handleLink();
    }
};