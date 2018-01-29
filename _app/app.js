import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import Vuex from 'vuex';
import { store } from 'js/global-store';
import ResourceList from 'vue/resource-list.vue';
import Filter from 'vue/filter.vue';
import Pagination from 'vue/pagination.vue';
import * as Utility from 'js/utility';

(function () {
  const apiPath = Config.apiPath;

  // Load data.
  let requestPromises = [];
  requestPromises.push(Utility.loadJSON(apiPath + 'resources?limit=' + store.state.pagination.resultsPerPage));
  requestPromises.push(Utility.loadJSON(apiPath + 'countries'));
  requestPromises.push(Utility.loadJSON(apiPath + 'regions'));
  requestPromises.push(Utility.loadJSON(apiPath + 'languages'));
  requestPromises.push(Utility.loadJSON(apiPath + 'topics'));
  requestPromises.push(Utility.loadJSON(apiPath + 'resource_types'));
      
  Promise.all(requestPromises).then(function (results) {
    const resourceResults = results[0];
    const countries = results[1];
    const regions = results[2];
    const languages = results[3];
    const topics = results[4];
    const resource_types = results[5];
      
    const resources = Utility.formatResults(
      resourceResults.rows,
      ['date_published'],
      false);

    // Initialize global storage.
    store.commit('setCurrentPage', 1);
    store.commit('setResultsPerPage', 10);
    store.commit('setTotalResults', resourceResults.count);
    store.commit('setResources', resources);
    store.commit('setTopics', topics);
    store.commit('setCountries', countries);
    store.commit('setRegions', regions);
    store.commit('setLanguages', languages);
    store.commit('setTypes', resource_types);

    new Vue({
      store,
      el: '#directory',
      data: function () {
        return {
          filterOptions: store.state.filterOptions,
        };
      },
      computed: {
        sharedState: function () {
          return store.state;
        },
        pagination: function () {
          return store.state.pagination;
        },
      },
      methods: {
        search: function () {
          store.commit('setSearch', this.searchQuery);
        },
        changePage(pageNumber) {
          const offset = this.pagination.resultsPerPage * (pageNumber - 1);

          Utility.loadJSON(apiPath + 'resources' +
            '?limit=' + this.pagination.resultsPerPage +
            '&offset=' + offset)
          .then((results) => {
            // Check whether resource count has been updated.
            if (results.count !== this.totalItems) {
              this.totalItems = results.count;
            }

            let resources = Utility.formatResults(
              results.rows,
              ['date_published'],
              false);

            store.commit('setResources', resources);
          });

          store.commit('setCurrentPage', pageNumber);
          console.log('Current resources page: ' + this.pagination.currentPage);
        },
        clearAll: function () {
          console.log('Clearing filters.');
          store.commit('clearFilters');
          console.log(store.state);
        },
      },
      components: {
        'resource-list': ResourceList,
        'resource-filter': Filter,
        'pagination': Pagination,
      },
    });
  });
})();