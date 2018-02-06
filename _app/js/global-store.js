import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import Vuex from 'vuex';
import * as Utility from 'js/utility';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    searchQuery: '',
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
    },
    setSearch: function (state, queryString) {
      Vue.set(state, 'searchQuery', queryString);
    },
    clearSearch: function (state) {
      Vue.set(state, 'searchQuery', '');
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
