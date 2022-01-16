let changeColor = document.getElementById("changeColor");

chrome.storage.sync.get("color", ({ color }) => {
  changeColor.style.backgroundColor = color;
});


// document.title = "Hello World";


// When the button is clicked, inject setPageBackgroundColor into current page
changeColor.addEventListener("click", async () => {
    let [tab] = await chrome.tabs.query({ active: true, currentWindow: true });

    fetch('http://localhost:8000/test',{
    method: 'POST',
    headers: {
      'Content-Type':'application/json',
      'Accept': 'application/json'
    },
    body:JSON.stringify({
      "title":tab.title,
      "url":tab.url,
    })
  });
  
    chrome.scripting.executeScript({
      target: { tabId: tab.id },
      function: setPageBackgroundColor,
    });
  });
  
  // The body of this function will be executed as a content script inside the
  // current page
  function setPageBackgroundColor() {
    chrome.storage.sync.get("color", ({ color }) => {
      // document.body.style.backgroundColor = color;


  });
  }

