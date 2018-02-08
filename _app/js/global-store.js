import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

// For (re)setting filters.
function filterSet () {
  return {
    country: {},
    language: {},
    tags: {},
    topic: {},
    type: {},
  };
};

// Create namespaced state storage for filters.
const filterModule = {
  state: {
    selectedFilters: {
      country: {},
      language: {},
      tags: {},
      topic: {},
      type: {},
    },
  },
  mutations: {
    activateFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        Vue.set(state.selectedFilters, filter.category, {});
      }

      Vue.set(state.selectedFilters[filter.category], filter.value, true);
    },
    deactivateFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        Vue.set(state.selectedFilters, filter.category, {});
      }

      let selectedFilters = state.selectedFilters[filter.category];
      if (filter.value in selectedFilters) {
        Vue.delete(selectedFilters, filter.value);
      }
    },
    toggleFilter: function (state, filter) {
      if (!(filter.category in state.selectedFilters)) {
        Vue.set(state.selectedFilters, filter.category, {});
      }

      let selectedFilters = state.selectedFilters[filter.category];
      if (filter.value in selectedFilters) {
        Vue.delete(selectedFilters, filter.value);
      } else {
        Vue.set(selectedFilters, filter.value, true);
      }
    },
    clearAllFilters: function (state) {
      Vue.set(state.selectedFilters, filterSet());
    },
  },
};

export const store = new Vuex.Store({
  modules: {
    filters: filterModule,
  },
});