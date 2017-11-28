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

  function buildIndex(documents) {
    return new Promise(function (resolve, reject) {
      // Build Lunr index.
      var idx = lunr(function () {
        this.ref('id');
        this.field('title');
        this.field('organization');
        this.field('date_published');
        this.field('url');
        this.field('type');

        documents.forEach(function (doc, index) {
          this.add(Object.assign({ 'id': index }, doc));
        }, this);
      });

      resolve(idx);
    });
  }

  var idx;
  var resources;

  // Load JSON data into Lunr index.
  var filepath = '/search_data.json';
  var documentsRequest = loadJSON(filepath);

  documentsRequest.then(function (documents) {
    resources = documents;
    buildIndex(documents).then(function (result) {
      idx = result;
    });

    Vue.component('directory-list', {
      template: "#directory-list-template",
      props: {
        data: Array,
        filterKey: String
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
          var filterKey = this.filterKey && this.filterKey.toLowerCase();
  
          if (filterKey) {
            var results = idx.search(filterKey);

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
      filters: {
        capitalize: function (str) {
          return str.charAt(0).toUpperCase() + str.slice(1);
        }
      },
      methods: {
        sortBy: function (key) {
          this.sortKey = key;
          this.sortOrders[key] = this.sortOrders[key] * -1;
        },
      },
      delimiters: ['((', '))']
    });

    Vue.component('directory-table', {
      template: "#directory-table-template",
      props: {
        data: Array,
        columns: Array,
        filterKey: String
      },
      data: function () {
        var sortOrders = {}
        this.columns.forEach(function (key) {
          sortOrders[key] = 1
        })
        return {
          sortKey: '',
          sortOrders: sortOrders
        }
      },
      computed: {
        filteredData: function () {
          var sortKey = this.sortKey
          var filterKey = this.filterKey && this.filterKey.toLowerCase()
          var order = this.sortOrders[sortKey] || 1
          var data = this.data
          if (filterKey) {
            data = data.filter(function (row) {
              return Object.keys(row).some(function (key) {
                return String(row[key]).toLowerCase().indexOf(filterKey) > -1
              })
            })
          }
          if (sortKey) {
            data = data.slice().sort(function (a, b) {
              a = a[sortKey]
              b = b[sortKey]
              return (a === b ? 0 : a > b ? 1 : -1) * order
            })
          }
          return data
        }
      },
      filters: {
        capitalize: function (str) {
          return str.charAt(0).toUpperCase() + str.slice(1);
        }
      },
      methods: {
        sortBy: function (key) {
          this.sortKey = key;
          this.sortOrders[key] = this.sortOrders[key] * -1;
        },
      },
      delimiters: ['((', '))']
    });

    var search_app = new Vue({
      el: '#directory',
      data: {
        searchQuery: '',
        resources: resources
      }
    });
  });
})();
