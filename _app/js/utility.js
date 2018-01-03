export {
  getURLParameters,
  loadJSON,
  tokenizeArray,
  getPublicationMonth
}

// Parse parameters from URL.
function getURLParameters () {
  var paramstrings = window.location.search.substr(1).split('&');

  if (paramstrings == '') {
    return {};
  }

  var params = {};

  for (var i = 0; i < paramstrings.length; ++i) {
    var param = paramstrings[i].split('=', 2);
    if (param.length == 1)
      params[param[0]] = '';
    else
      params[param[0]] = decodeURIComponent(param[1].replace(/\+/g, ' '));
  }

  return params;
}

function loadJSON(filepath) {
  return new Promise(function (resolve, reject) {
    var xhr = new XMLHttpRequest();
    xhr.overrideMimeType('application/json');
    xhr.open('GET', filepath, true);
    xhr.onload = function () {
      if (xhr.status == '200') {
            resolve(JSON.parse(xhr.responseText));
      } else {
        reject(xhr.statusText);
      }
    }
    xhr.onerror = () => reject(xhr.statusText);
    xhr.send();
  });
}

function tokenizeArray(array) {
  // Tokenizes array of strings, splitting on commas and whitespace.
  var all_tokens = [];
  var arrayCount = array.length;

  for (var i = 0; i < arrayCount; i++) {
    var string_tokens = array[i].split(/,?\s+/);
    all_tokens = all_tokens.concat(string_tokens);
  }

  return all_tokens;
}

function getPublicationMonth (dateObject) {
  var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  var datestring = months[dateObject.getMonth()] + ' ' + dateObject.getFullYear();
  return datestring;
}
