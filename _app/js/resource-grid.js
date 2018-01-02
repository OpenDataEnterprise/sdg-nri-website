(function () {
  // Parse parameters from URL.
  var qs = (function(paramstrings) {
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
  })(window.location.search.substr(1).split('&'));

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
  };

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

  function buildIndex(documents) {
    return new Promise(function (resolve, reject) {
      // Build Lunr index.
      var idx = lunr(function () {
        this.ref('id');
        this.field('title');
        this.field('organization');
        this.field('date_published');
        this.field('year');
        this.field('type');
        this.field('languages');
        this.field('tags');

        documents.forEach(function (doc, index) {
          indexed_doc = Object.assign({ 'id': index }, doc);
          this.add(indexed_doc);
        }, this);
      });

      resolve(idx);
    });
  }

  function getPublicationMonth (dateObject) {
    var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var datestring = months[dateObject.getMonth()] + ' ' + dateObject.getFullYear();
    return datestring;
  }

  var idx;
  var resources;

  // Load JSON data into Lunr index.
  var requestPromises = [];
  requestPromises.push(loadJSON('/search_data.json'));
  requestPromises.push(loadJSON('/mock_api/countries.json'));
  requestPromises.push(loadJSON('/mock_api/regions.json'));
  requestPromises.push(loadJSON('/mock_api/languages.json'));
  requestPromises.push(loadJSON('/mock_api/topics.json'));

  Promise.all(requestPromises).then(function (results) {
    var documents = results[0];
    var countries = results[1];
    var regions = results[2];
    var languages = results[3];
    var topics = results[4];

    // Build resource index.
    resources = documents;
    buildIndex(resources).then(function (result) {
      idx = result;
    });

    // Build list of subjects.
    var subjects = [];
    for (var i = 0; i < resources.length; i++) {
      var subject = resources[i]['subject'];

      if (subject) {
        subjects[subject] = '';
      }

      // Piggybacking on this loop, format publication dates.
      if (resources[i]['date_published']) {
        var date = new Date(resources[i]['date_published']);
        if (date != 'Invalid Date') {
          resources[i]['date_published'] = getPublicationMonth(date);
        }
      }
    }

    // Shared state storage container.
    var store = {
      selectedFilters: {},
      countries: countries,
      regions: regions,
      languages: languages,
      topics: topics
    };

    var search_app = new Vue({
      el: '#directory',
      data: function () {
        return {
          searchQuery: '',
          resources: resources,
          filterSelection: [],
          sharedState: store
        };
      },
      methods: {
        clearAll: function () {
	  this.sharedState.filterValues = [];
        }
      },
      watch: {
        sharedState: {
          handler: function () {
            let selectedFilters = [];
            let filterSets = this.sharedState.selectedFilters;
            for (var key in filterSets) {
              selectedFilters = selectedFilters.concat(filterSets[key]);
            }

            this.filterSelection = selectedFilters;
          },
          deep: true,
        }
      },
    });
  });
})();
