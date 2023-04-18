const targetNode = document.getElementsByClassName('fast_filters_ul')[0];

var intervals = {}

const font = new FontFace('EuclidFont', 'url(fonts/EuclidFont.ttf)');
font.load().then(() => {
  document.fonts.add(font);
  basic_position = Math.min(window.innerWidth - countWholeLength(targetNode.children),0);
  [...targetNode.children].forEach(function(element, index) {
    element.style.position = "absolute";
    element.style.left = basic_position + "px";
    basic_position = basic_position + 20 + element.offsetWidth
    var intervalID = startMoving(element, index)
    intervals[index] = intervalID
  });
});


targetNode.addEventListener('mouseenter', function() {
  arrayOfFilteredChildren = [...targetNode.children].filter(function(element, index) {return element.id != ('clone' + (index-1))});
  console.log(arrayOfFilteredChildren);
  [...arrayOfFilteredChildren].forEach(function(element, index) {
    clearInterval(intervals[index])
  })
  clearInterval(intervals['clone'])
  console.log(intervals)
});
  
targetNode.addEventListener('mouseleave', function() {
  arrayOfFilteredChildren = [...targetNode.children].filter(function(element, index) {return element.id != ('clone' + (index-1))});
  console.log(arrayOfFilteredChildren);
  [...arrayOfFilteredChildren].forEach(function(element, index) {
    var intervalID = startMoving(element, index)
    intervals[index] = intervalID
  })

  clones = document.querySelectorAll('[id^="clone"]')
  if (clones != null){
    clone = clones[0]
    if (clone != null){
      const intervalClone = setInterval(function(){
        clone.style.left = parseFloat(clone.style.left) +  0.4 + "px";
      },3,'clone')
      intervals['clone'] = intervalClone
    }
  }
});


function startMoving(element, index){
  var clone = null
  if(element.id[0] =='c') return 
  const intervalID = setInterval(function() {
    nextNode = element.nextElementSibling
    clones = document.querySelectorAll('[id^="clone"]')
    if (clones != null){
      nclone = clones[0]
      if (nclone != null){
          if (parseFloat(nclone.style.left) > (document.documentElement.clientWidth)){
          nclone.remove();
          clearInterval(intervals['clone'])
          }
      }
    }
    if (parseFloat(element.style.left) > (document.documentElement.clientWidth - element.offsetWidth)){    
      if(nextNode === null){
        console.log(element)
        nextNode = element.parentElement.firstElementChild
      }
      if (clone === null){
        clone = element.cloneNode(true)
        clone.setAttribute("id", "clone" + index)
        targetNode.insertBefore(clone, nextNode)
        clearInterval(intervals['clone'])
        const intervalClone = setInterval(function(){
          clone.style.left = parseFloat(clone.style.left) +  0.4 + "px";
        },3,'clone')
        intervals['clone'] = intervalClone
      }
      
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
  return intervalID
}

function countWholeLength(elements){
  sum = 0;
  [...elements].forEach(function(element, index) {
    sum += element.offsetWidth + 20
  });
  return sum
}




