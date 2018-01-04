import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    resources: [],
    index: {},
    searchText: '',
    selectedFilters: {},
    countries: [],
    regions: [],
    languages: [],
    topics: [],
    types: [
      {
        'label': 'Report / Article',
        'type': 'report'
      },
      {
        'label': 'Guide / Assessment',
        'type': 'guide'
      },
      {
        'label': 'Webinar / Presentation',
        'type': 'presentation'
      },
      {
        'label': 'Website',
        'type': 'website'
      }
    ]
  },
  mutations: {
    toggleFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        Vue.set(state.selectedFilters, filter.category, []);
      }

      var filterCategory = state.selectedFilters[filter.category];
      if (filter.value in filterCategory) {
        Vue.delete(filterCategory, filter.value);
      } else {
        Vue.set(filterCategory, filter.value, true);
      }
    },
    clearFilterType: function (state, type) {
      console.log('clearing ' + type);
      Vue.delete(state.selectedFilters, type);
      console.log(state.selectedFilters);
    },
    clearFilters: function (state) {
      state.selectedFilters = {};
    },
    setSearch: function (state, text) {
      state.searchText = text;
    },
    clearSearch: function (state) {
      state.searchText = '';
    },
    setResources: function (state, resources) {
      state.resources = resources;
    },
    setIndex: function (state, index) {
      state.index = index;
    },
    setTopics: function (state, topics) {
      state.topics = topics;
    },
    setCountries: function (state, countries) {
      state.countries = countries;
    },
    setRegions: function (state, regions) {
      state.regions = regions;
    },
    setLanguages: function (state, languages) {
      state.languages = languages;
    }
  },
  getters: {
    filters: function (state) {
      let selectedFilters = [];

      for (let category in state.selectedFilters) {
        for (let filter in state.selectedFilters[category]) {
          selectedFilters.push(filter);
        }
      }

      return selectedFilters;
    },
    filteredResources: function (state, getters) {
      let data = [];
      var resources = state.resources;
      var filterKey = state.searchText;
      var filters = getters.filters.join(' ');
      var query = [filterKey, filters].filter(function (val) { return val.toLowerCase(); }).join(' ');

      if (query) {
        var results = state.index.search(query);

        if (results) {
          results.forEach(function (result) {
            var index = parseInt(result.ref);
            data.push(resources[index]);
          });
        }
      } else {
        data = resources;
      }
 
      return data;
    }
  }
});
