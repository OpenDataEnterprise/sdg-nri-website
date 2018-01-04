import lunr from 'lunr';
import Vue from 'vue';
import Vuex from 'vuex';
import { store } from 'js/global-store';
import ResourceList from 'vue/resource-list.vue';
import Filter from 'vue/filter.vue';
import * as Utility from 'js/utility';

(function () {
  function buildIndex(documents) {
    // Build Lunr index.
    var index = lunr(function () {
      this.ref('id');
      this.field('title');
      this.field('organization');
      this.field('date_published');
      this.field('year');
      this.field('type');
      this.field('languages');
      this.field('tags');

      documents.forEach(function (doc, index) {
        var indexed_doc = Object.assign({ 'id': index }, doc);
        this.add(indexed_doc);
      }, this);
    });

    return index;
  }

  var resources;
  var index;

  // Load data from JSON files.
  var requestPromises = [];
  requestPromises.push(Utility.loadJSON('/search_data.json'));
  requestPromises.push(Utility.loadJSON('/mock_api/countries.json'));
  requestPromises.push(Utility.loadJSON('/mock_api/regions.json'));
  requestPromises.push(Utility.loadJSON('/mock_api/languages.json'));
  requestPromises.push(Utility.loadJSON('/mock_api/topics.json'));

  Promise.all(requestPromises).then(function (results) {
    var documents = results[0];
    var countries = results[1];
    var regions = results[2];
    var languages = results[3];
    var topics = results[4];

    // Build resource index.
    resources = documents;

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
          resources[i]['date_published'] = Utility.getPublicationMonth(date);
        }
      }
    }

    // Build search indices.
    index = buildIndex(resources);
    console.log(index);

    // Initialize global storage.
    store.commit('setResources', resources);
    store.commit('setIndex', index);
    store.commit('setTopics', topics);
    store.commit('setCountries', countries);
    store.commit('setRegions', regions);
    store.commit('setLanguages', languages);
    console.log(store.state);

    new Vue({
      el: '#directory',
      data: function () {
        return {
          resources: resources,
          index: index,
          searchQuery: '',
          filterSelection: [],
          sharedState: store.state
        };
      },
      methods: {
        clearAll: function () {
          store.commit('clearFilters');
        }
      },
      components: {
        'resource-list': ResourceList,
        'resource-filter': Filter
      },
      mounted: function () {

      }
    });
  });
})();