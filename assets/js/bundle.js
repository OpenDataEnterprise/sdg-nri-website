/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

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

    Vue.component('item', {
      template: '#item-template',
      props: {
        valueField: {
          type: String,
          default: ''
        },
        labelField: {
          type: String,
          default: ''
        },
        childrenField: {
          type: String,
          default: ''
        },
        model: {
          type: Object
        }
      },
      data: function () {
        return {
          checked: false,
          expanded: false
        };
      },
      computed: {
        isExpandable: function () {
          if (!this.childrenField ||
            !(this.childrenField in this.model)) {
            return false;
          }

          return this.model[this.childrenField] &&
            this.model[this.childrenField].length;
        }
      },
      methods: {
        toggle: function () {
          if (this.isExpandable) {
            this.expanded = !this.expanded;
          }
        },
        emitFilterUpdate: function (e) {
          var value = this.model[this.valueField];
          var flag = e.target.checked;
          console.log("Emitting " + value + ":" + flag + "!");
          EventBus.$emit('filterUpdate', value, flag);
        }
      },
      delimiters: ['((', '))']
    });

    Vue.component('search-filter', {
      template: '#filter-template',
      props: {
        valueField: {
          type: String,
          default: ''
        },
        labelField: {
          type: String,
          default: ''
        },
        childrenField: {
          type: String,
          default: ''
        },
        filterType: {
          type: String
        },
        options: {
          type: Array
        }
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
          var el = this.$el;
          var target = e.target;
          if ((el !== target) && !el.contains(target)) {
            this.visible = false;
          }
        },
        updateFilter: function (value) {
          console.log("Detected " + value + "!");
          this.filterValues.push(value);
        },
        clear: function () {
	  this.filterValues = [];
        }
      },
      created () {
        //document.addEventListener('click', this.documentClick)
      },
      destroyed () {
        //document.removeEventListener('click', this.documentClick)
      },
      delimiters: ['((', '))']
    });

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


/***/ })
/******/ ]);