export {
  getURLParameters,
  loadJSON,
  tokenizeArray,
  getPublicationDate,
  formatResults,
}

/**
 * Parse parameters from URL string.
 */
function getURLParameters () {
  let paramstrings = window.location.search.substr(1).split('&');

  if (paramstrings == '') {
    return {};
  }

  let params = {};

  for (let i = 0; i < paramstrings.length; ++i) {
    let param = paramstrings[i].split('=', 2);
    if (param.length == 1)
      params[param[0]] = '';
    else
      params[param[0]] = decodeURIComponent(param[1].replace(/\+/g, ' '));
  }

  return params;
}

/**
 * Load JSON format data from path.
 */
function loadJSON (path) {
  return new Promise((resolve, reject) => {
    let xhr = new XMLHttpRequest();
    xhr.overrideMimeType('application/json');
    xhr.open('GET', path, true);
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

/**
 * Tokenizes array of strings, splitting on commas and whitespace.
 */
function tokenizeArray (array) {
  let all_tokens = [];
  const arrayCount = array.length;

  for (let i = 0; i < arrayCount; i++) {
    const string_tokens = array[i].split(/,?\s+/);
    all_tokens = all_tokens.concat(string_tokens);
  }

  return all_tokens;
}

/**
 * Converts Date object into a human-friendly string format.
 */
function getPublicationDate (dateObject, getDay) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  let dateString = months[dateObject.getMonth()] + ' ' + dateObject.getFullYear();

  if (getDay) {
    dateString = dateObject.getDate() + ' ' + dateString;
  }

  return dateString;
}

// Format the given fields as dates.
function formatResults (results, fields, includeDay) {
  if (Array.isArray(results)) {
    const resultCount = results.length;

    for (var i = 0; i < resultCount; i++) {
      const fieldCount = fields.length;

      for (let j = 0; j < fieldCount; j++) {
        const field = fields[j];

        if (field in results[i]) {
          if (results[i][field]) {
            const date = new Date(results[i][field]);

            if (date !== 'Invalid Date') {
              results[i][field] = getPublicationDate(date, includeDay);
            }
          }
        }
      }
    }
  }

  return results;
}
