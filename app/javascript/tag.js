window.addEventListener("load", (e) => {
  const inputElement = document.getElementById("input-tag")
  inputElement.addEventListener("keyup", (e) => {
    const input = document.getElementById("input-tag").value;
    const xhr = new XMLHttpRequest();
    xhr.open("GET", `/items/tagsearch/?input=${input}`, true);
    xhr.responseType = "json";
    xhr.send();
    xhr.onload = () => {
      const tagName = xhr.response.inputword;
      const searchResult = document.getElementById('search-result')
      searchResult.innerHTML = ''
      tagName.forEach(function(tag){

        const parentsElement = document.createElement('div')
        const childElement = document.createElement('div')

        parentsElement.setAttribute('id', 'parents')
        childElement.setAttribute('id', tag.id )
        childElement.setAttribute('class', 'child' )
        
        parentsElement.appendChild(childElement)
        childElement.innerHTML = tag.name
        searchResult.appendChild(parentsElement)

        const clickElement = document.getElementById(tag.id)
        clickElement.addEventListener("click", () => {
          document.getElementById("input-tag").value = clickElement.textContent;
          clickElement.remove();
        })
      })
    }
  });
})