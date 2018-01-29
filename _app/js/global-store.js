import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import Vuex from 'vuex';
import * as Utility from 'js/utility';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    resources: [],
    index: {},
    searchText: '',
    pagination: {
      currentPage: 1,
      resultsPerPage: 10,
      totalResults: 0,
    },
    filterOptions: {
      country: [],
      region: [],
      language: [],
      topic: [],
      type: [],
    },
    selectedFilters: {},
  },
  mutations: {
    toggleFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        Vue.set(state.selectedFilters, filter.category, {});
      }

      let filterCategory = state.selectedFilters[filter.category];
      if (filter.value in filterCategory) {
        Vue.delete(filterCategory, filter.value);

        // If there are no filters selected, remove the category.
        if (!Object.keys(filterCategory).length) {
          Vue.delete(state.selectedFilters, filter.category);
        }
      } else {
        Vue.set(filterCategory, filter.value, true);
      }
    },
    clearFilterCategory: function (state, category) {
      Vue.delete(state.selectedFilters, category);
    },
    clearFilters: function (state) {
      for (let category in state.selectedFilters) {
        Vue.delete(state.selectedFilters, category);
      }
      //Vue.set(state, 'selectedFilters', {});
    },
    setSearch: function (state, text) {
      state.searchText = text;
    },
    clearSearch: function (state) {
      state.searchText = '';
    },
    setResources: function (state, resources) {
      Vue.set(state, 'resources', resources);
    },
    setIndex: function (state, index) {
      state.index = index;
    },
    setTopics: function (state, topics) {
      Vue.set(state.filterOptions, 'topic', topics);
    },
    setCountries: function (state, countries) {
      Vue.set(state.filterOptions, 'country', countries);
    },
    setRegions: function (state, regions) {
      Vue.set(state.filterOptions, 'region', regions);
    },
    setLanguages: function (state, languages) {
      Vue.set(state.filterOptions, 'language', languages);
    },
    setTypes: function (state, types) {
      Vue.set(state.filterOptions, 'type', types);
    },
    setCurrentPage: function (state, currentPage) {
      // Non-positive page numbers should never happen, but this is an explicit safety check.
      if (currentPage < 1) {
        currentPage = 1;
      }

      Vue.set(state.pagination, 'currentPage', currentPage);
    },
    setResultsPerPage: function (state, resultsPerPage) {
      Vue.set(state.pagination, 'resultsPerPage', resultsPerPage);
    },
    setTotalResults: function(state, totalResults) {
      Vue.set(state.pagination, 'totalResults', totalResults);
    }
  },
  getters: {
    filters: (state) => {
      let selectedFilters = [];

      for (let category in state.selectedFilters) {
        for (let filter in state.selectedFilters[category]) {
          selectedFilters.push(filter);
        }
      }

      return selectedFilters;
    },
    getQueryString: (state) => {
      let queryString = '?limit=' + state.pagination.resultsPerPage;

      const categories = Object.keys(state.selectedFilters);
      const categoryCount = categories.length;

      for (let i = 0; i < categoryCount; ++i) {
        const category = categories[i];
        const selectedOptions = Object.keys(state.selectedFilters[category]);
        const selectedOptionsCount = selectedOptions.length;

        if (!selectedOptions.length) {
          continue;
        }

        queryString = queryString + '&' + category + '=';

        for (let j = 0; j < selectedOptionsCount; j++) {
          if (j > 0) {
            queryString += ',';
          }

          queryString = queryString + selectedOptions[j];
        }
      }

      return queryString;
    },
  },
  actions: {
    filterResources: async (context) => {
      let queryString = context.getters.getQueryString;
      console.log(queryString);

      const resourcePath = Config.apiPath + 'resources';
      const results = await Utility.loadJSON(resourcePath + queryString);

      let resources = Utility.formatResults(
        results.rows,
        ['date_published'],
        false);
      context.commit('setCurrentPage', 1);
      context.commit('setTotalResults', results.count);
      context.commit('setResources', resources);
    },
  }
});
