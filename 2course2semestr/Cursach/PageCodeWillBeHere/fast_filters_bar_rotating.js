const targetNode = document.getElementsByClassName('fast_filters_ul')[0];

var intervals = {}
basic_position = 20;




const font = new FontFace('EuclidFont', 'url(fonts/EuclidFont.ttf)');
font.load().then(() => {
  document.fonts.add(font);
  [...targetNode.children].forEach(function(element, index) {
    element.style.position = "absolute";
    element.style.left = basic_position + "px";
    basic_position = basic_position + 20 + element.offsetWidth
    var intervalID = startMoving(element, index)
  });
});


targetNode.addEventListener('mouseenter', function() {
  arrayOfFilteredChildren = [...targetNode.children].filter(function(element, index) {return element.id != ('clone' + (index - 1))});
  [...arrayOfFilteredChildren].forEach(function(element, index) {
    console.log(index)
    clearInterval(index)

  })
  clearInterval('clone')
  console.log(intervals)
});
  
targetNode.addEventListener('mouseleave', function() {
  arrayOfFilteredChildren = [...targetNode.children].filter(function(element, index) {return element.id != ('clone' + (index - 1))});
  [...arrayOfFilteredChildren].forEach(function(element, index) {
    console.log(index)    
    var intervalID = startMoving(element, index)
    
  })
  clone = document.querySelectorAll('[id^="clone"]');
  console.log(clone)
  if (clone != null){
    setInterval(function(){
      clone[0].style.left = parseFloat(clone[0].style.left) +  0.4 + "px";
    }, 3, 'clone')
  }
});


function startMoving(element, index){
  var clone = null
  const intervalID = setInterval(function() {
    nextNode = element.nextElementSibling
    nclone = document.getElementById("clone" + index);
    if (parseFloat(element.style.left) > 0.0){
      if (nclone != null)
        nclone.remove();
        clearInterval('clone')
    }
    if ((parseFloat(element.style.left) > (window.innerWidth - element.offsetWidth)) && (parseFloat(element.style.left) < window.innerWidth)){    
      if(nextNode === null){
        nextNode = element.parentElement.firstElementChild
      }
      clone = element.cloneNode(true)
      clone.setAttribute("id", "clone" + index)
      targetNode.insertBefore(clone, nextNode)
      clearInterval('clone')  
      if (nextNode != null ){
        nextNodePostition = parseFloat(nextNode.style.left)
        element.style.left = parseFloat(nextNode.style.left) - 20 - element.offsetWidth + 'px'
      }
      else{
        if (element.style.left === nextNode.style.left){
          element.style.left = (-1) * element.offsetWidth + 'px'
        }
        else{
          element.style.left = parseFloat(nextNode.style.left) - 20 - element.offsetWidth + 'px'
        }
      }
      
    }
    
    element.style.left = parseFloat(element.style.left) +  0.4 + "px";
  }, 3, index);

  const intervalClone = setInterval(function(){
    if(clone != null){
      clone.style.left = parseFloat(clone.style.left) +  0.4 + "px";
    }
  },3,'clone')
  return intervalID
}




