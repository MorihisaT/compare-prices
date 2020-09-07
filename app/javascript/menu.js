function pulldown() {
  
  const pullDownButton = document.getElementById("menus")
  const pullDownParents = document.getElementById("pull-down")
  
  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:blue;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:blue;")
  })

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      pullDownParents.setAttribute("style", "display:block;")
    }
  })
}
window.addEventListener('load', pulldown)