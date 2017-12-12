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
  var filepath = '/search_data.json';
  var documentsRequest = loadJSON(filepath);

  documentsRequest.then(function (documents) {
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
    };

    Vue.component('directory-list', {
      template: "#directory-list-template",
      props: {
        data: Array,
        filterKey: String,
        filters: Array,
      },
      data: function () {
        return {
          resources: resources
        };
      },
      computed: {
        filteredData: function () {
          var data = [];
          var resources = this.resources;
          var filterKey = this.filterKey;
          var filters = this.filters.join(' ');
          var query = [filterKey, filters].filter(function (val) { return val.toLowerCase(); }).join(' ');
  
          if (query) {
            var results = idx.search(query);

            if (results) {
              results.forEach(function (result) {
                var index = parseInt(result.ref);
                data.push(resources[index]);
              });
            }
          } else {
            data = this.resources;
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
      el: '#directory',
      data: {
        searchQuery: '',
        resources: resources,
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
      },
      /*components: {
        'org-filter': Filter,
        'year-filter': Filter,
        'lang-filter': Filter
      }*/
    });


  });
})();
