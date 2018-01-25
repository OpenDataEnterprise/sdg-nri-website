import Config from 'config';
import Vue from 'vue';
import Vuex from 'vuex';
import { store } from 'js/global-store';
import ResourceList from 'vue/resource-list.vue';
import Filter from 'vue/filter.vue';
import * as Utility from 'js/utility';

(function () {
  var resources;

  // Load data.
  var requestPromises = [];
  var apiPath = Config.apiPath;
  requestPromises.push(Utility.loadJSON(apiPath + 'resources'));
  requestPromises.push(Utility.loadJSON(apiPath + 'countries'));
  requestPromises.push(Utility.loadJSON(apiPath + 'regions'));
  requestPromises.push(Utility.loadJSON(apiPath + 'languages'));
  requestPromises.push(Utility.loadJSON(apiPath + 'topics'));
  requestPromises.push(Utility.loadJSON(apiPath + 'resource_types'));

  Promise.all(requestPromises).then((results) => {
    var resources = results[0];
    var countries = results[1];
    var regions = results[2];
    var languages = results[3];
    var topics = results[4];
    var resource_types = results[5];

    // Build list of subjects.
    var subjects = [];
    for (var i = 0; i < resources.length; i++) {
      var subject = resources[i]['subject'];

      if (subject) {
        subjects[subject] = '';
      }

      // Format publication dates.
      if (resources[i]['date_published']) {
        var date = new Date(resources[i]['date_published']);
        if (date != 'Invalid Date') {
          resources[i]['date_published'] = Utility.getPublicationDate(date, false);
        }
      }
    }

    new Vue({
      store,
      el: '#directory',
      data: () => {
        return {
          resources: resources,
          searchQuery: '',
          filterSelection: [],
          sharedState: store.state,
        };
      },
      methods: {
        search: () => {
          store.commit('setSearch', this.searchQuery);
        },
        submitFilters: async () => {
          await store.dispatch('filterResources');
        },
        clearAll: () => {
          console.log('Clearing filters.');
          store.commit('clearFilters');
          console.log(store.state);
        },
      },
      beforeCreate: () => {
        // Initialize global storage.
        store.commit('setResources', resources);
        store.commit('setTopics', topics);
        store.commit('setCountries', countries);
        store.commit('setRegions', regions);
        store.commit('setLanguages', languages);
        store.commit('setTypes', resource_types);
      },
      components: {
        'resource-list': ResourceList,
        'resource-filter': Filter,
      },
    });
  });
})();
