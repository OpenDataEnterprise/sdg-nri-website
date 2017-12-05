(function () {
  function loadJSON(filepath) {
    return new Promise(function (resolve, reject) {
      var xhr = new XMLHttpRequest();
      xhr.overrideMimeType("application/json");
      xhr.open('GET', filepath, true);
      xhr.onload = function () {
        if (xhr.status == "200") {
  	      resolve(JSON.parse(xhr.responseText));
        } else {
          reject(xhr.statusText);
        }
      }
      xhr.onerror = () => reject(xhr.statusText);
      xhr.send();
    });
  }

  function toggleResources (event) {
    console.log('Toggle triggered');
    // Get list node at the top of this group.
    var groupEl = event.target.parentNode.parentNode;

    // Get each list item in the group.
    var items = groupEl.getElementsByClassName('resource-list-item');
    var itemCount = items.length;

    // Toggle hiding on each item in the group.
    for (var i = 0; i < itemCount; i++) {
      items[i].classList.toggle('hide-resource');
    }
  }

  var resources;

  // Load JSON data.
  var filepath = '/search_data.json';
  var documentsRequest = loadJSON(filepath);

  documentsRequest.then(function (documents) {
    resources = documents;

    var buttons = document.getElementsByClassName('resource-list-toggle');
    var buttonCount = buttons.length;

    for (var i = 0; i < buttonCount; i++) {
      buttons[i].addEventListener('click', toggleResources);
    }
  });
})();
