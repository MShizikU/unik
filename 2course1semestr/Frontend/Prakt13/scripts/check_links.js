let links = document.querySelectorAll('a');
links.forEach(link => {
    let href = link.getAttribute('href');
    if (!href){
  
    } else if (!href.includes('://')){

    }
  
    else if (!href.startsWith('https')) {
    }
  
    else link.style.color = 'var(--lightgreen)';
})
