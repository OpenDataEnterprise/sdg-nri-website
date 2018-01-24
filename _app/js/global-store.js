import Vue from 'vue';
import Vuex from 'vuex';
import { loadJSON } from 'js/utility';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    resources: [],
    index: {},
    searchText: '',
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
      state.filterOptions.topic = topics;
    },
    setCountries: function (state, countries) {
      state.filterOptions.country = countries;
    },
    setRegions: function (state, regions) {
      state.filterOptions.region = regions;
    },
    setLanguages: function (state, languages) {
      state.filterOptions.language = languages;
    },
    setTypes: function (state, types) {
      state.filterOptions.type = types;
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
      let queryString = '';

      const categories = Object.keys(state.selectedFilters);
      const categoryCount = categories.length;

      for (let i = 0; i < categoryCount; ++i) {
        const category = categories[i];
        const selectedOptions = Object.keys(state.selectedFilters[category]);
        const selectedOptionsCount = selectedOptions.length;

        if (!selectedOptions.length) {
          continue;
        }

        if (i === 0) {
          queryString += '?';
        } else {
          queryString += '&';
        }

        queryString = queryString + category + '=';

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

      const resourcePath = 'http://localhost:3000/api/v1/resources';
      const results = await loadJSON(resourcePath + queryString);

      context.commit('setResources', results);
    },
  }
});
