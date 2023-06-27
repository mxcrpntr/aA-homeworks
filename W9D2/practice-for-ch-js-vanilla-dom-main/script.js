document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };
  const addForm = document.getElementById("form");
  addForm.addEventListener('submit', event => {
  event.preventDefault();
  const addInput = document.getElementById('favorite-input');
  const addName = addInput.value;

  const ul = document.querySelector("#sf-places ul");
  const li = document.createElement("li");
  li.textContent = addName;
  ul.appendChild(li);
  });

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });


  // adding SF places as list items

  // Your code here

  
  // adding new photos

  // Your code here
});