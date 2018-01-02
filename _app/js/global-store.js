import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    selectedFilters: {},
    countries: [],
    regions: [],
    languages: [],
    topics: []
  },
  mutations: {
    toggleFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        state.selectedFilters[filter.category] = [];
      }

      var filterCategory = state.selectedFilters[filter.category];
      if (filter.value in filterCategory) {
        delete filterCategory[filter.value];
      } else {
        filterCategory[filter.value] = true;
      }
    },
    clearFilters: function (state) {
      state.selectedFilters = {};
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
  }
});
