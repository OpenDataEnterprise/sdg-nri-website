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

  function buildNewsfeedIndex(documents) {
    return new Promise(function (resolve, reject) {
      // Build Lunr index.
      var idx = lunr(function () {
        this.ref('id');
        this.field('title');
        this.field('author');
        this.field('date');
        this.field('start_date');
        this.field('end_date');
        this.field('locations');
        this.field('description');
        this.field('tags');

        documents.forEach(function (doc, index) {
          indexed_doc = Object.assign({ 'id': index }, doc);

          if ('locations' in indexed_doc) {
            indexed_doc['locations'] = tokenizeArray(indexed_doc['locations']);
          }

          this.add(indexed_doc);
        }, this);
      });

      resolve(idx);
    });
  }

  function getPublicationMonth (dateObject) {
    var months = [
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
      'December'
    ];

    var datestring = dateObject.getDate() + ' ' + months[dateObject.getMonth()]
      + ' ' + dateObject.getFullYear();

    return datestring;
  }

  var newsfeedIdx;
  var newsfeed;

  // Load JSON data into Lunr index.
  var newsPath = '/news_data.json';
  var eventsPath = '/events_data.json';
  var newsRequest = loadJSON(newsPath);
  var eventsRequest = loadJSON(eventsPath);

  Promise.all([newsRequest, eventsRequest]).then(function (documents) {
    newsfeed = documents[0].concat(documents[1]);

    newsfeed.sort(function(a, b) {
        a = new Date(a['date']);
        b = new Date(b['date']);
        return (a > b) ? -1 : ((a < b) ? 1 : 0);
    });

    // Format dates before indexing.
    for (var i = 0; i < newsfeed.length; i++) {
      var fields = ['date', 'start_date', 'end_date'];
      for (var j = 0; j < fields.length; j++) {
        var field = fields[j];
        if (field in newsfeed[i]) {
          var date = new Date(newsfeed[i][field]);
          if (date != 'Invalid Date') {
            newsfeed[i][field] = getPublicationMonth(date);
          }
        }
      }
    }

    // Build newsfeed index.
    buildNewsfeedIndex(newsfeed).then(function (result) {
      newsfeedIdx = result;
    });

    // Shared state storage container.
    var store = {
        selectedFilters: {},
    };

    Vue.component('news-feed', {
      template: "#news-feed-template",
      props: {
        data: Array,
        filterKey: String,
        filters: Array,
      },
      data: function () {
        return {
          newsfeed: newsfeed
        };
      },
      computed: {
        filteredData: function () {
          var data = [];
          var newsfeed = this.newsfeed;
          var filterKey = this.filterKey;
          var filters = this.filters.join(' ');
          var query = [filterKey, filters].filter(function (val) { return val.toLowerCase(); }).join(' ');
  
          if (query) {
            var results = newsfeedIdx.search(query);

            if (results) {
              results.forEach(function (result) {
                var index = parseInt(result.ref);
                data.push(newsfeed[index]);
              });
            }
          } else {
            data = this.newsfeed;
          }
 
          return data;
        }
      },
      delimiters: ['((', '))']
    });

    Vue.component('search-filter', {
      template: '#filter-template',
      props: {
        filterType: String,
        options: Array
      },
      data: function () {
        return {
          visible: false,
          filterValues: [],
          sharedState: store
        }
      },
      watch: {
        filterValues: function (v) {
          Vue.set(this.sharedState.selectedFilters, this.filterType, v);
        }
      },
      methods: {
        documentClick: function (e) {
          let el = this.$el;
          let target = e.target;
          if ((el !== target) && !el.contains(target)) {
            this.visible = false;
          }
        },
        clear: function () {
	  this.filterValues = [];
        }
      },
      created () {
        document.addEventListener('click', this.documentClick)
      },
      destroyed () {
        document.removeEventListener('click', this.documentClick)
      },
      delimiters: ['((', '))']
    });

    var search_app = new Vue({
      el: '#news-feed',
      data: {
        searchQuery: '',
        newsfeed: newsfeed,
        filterSelection: [],
        sharedState: store
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
      }
    });


  });
})();
